<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:template name="formatdate">
      <xsl:param name="dateParam" />

      <xsl:variable name="mm" select="substring($dateParam,6,2)" />
      <xsl:variable name="dd" select="substring($dateParam,9,2)" />
      <xsl:variable name="yyyy" select="substring($dateParam,1,4)" />
      <xsl:choose>
        <xsl:when test="$mm = '01'">January</xsl:when>
        <xsl:when test="$mm = '02'">February</xsl:when>
        <xsl:when test="$mm = '03'">March</xsl:when>
        <xsl:when test="$mm = '04'">April</xsl:when>
        <xsl:when test="$mm = '05'">May</xsl:when>
        <xsl:when test="$mm = '06'">June</xsl:when>
        <xsl:when test="$mm = '07'">July</xsl:when>
        <xsl:when test="$mm = '08'">August</xsl:when>
        <xsl:when test="$mm = '09'">September</xsl:when>
        <xsl:when test="$mm = '10'">October</xsl:when>
        <xsl:when test="$mm = '11'">November</xsl:when>
        <xsl:when test="$mm = '12'">December</xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="$dd = '01'">&#160;1st</xsl:when>
        <xsl:when test="$dd = '02'">&#160;2nd</xsl:when>
        <xsl:when test="$dd = '03'">&#160;3rd</xsl:when>
        <xsl:otherwise>&#160;<xsl:value-of select="$dd"/></xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="concat(', ', $yyyy)" />
  </xsl:template>

  <xsl:template match="/">
     <html>

       <link rel="stylesheet" href="css/materialize.min.css" media="screen" charset="utf-8" />
       <link rel="stylesheet" href="css/main.css" media="screen" charset="utf-8" />
       <body style="font-family:Arial;font-size:12pt;background-color:#EEEEEE">
         <div class="container">
           <table class="responsive-table striped highlight">
             <thead>
               <th>#</th>
               <th>Author</th>
               <th>Title</th>
               <th>Genre</th>
               <th>Price</th>
               <th>Publish</th>
               <th>Description</th>
             </thead>
             <tbody>
               <xsl:for-each select="catalog/book">
                 <tr>
                   <td class="book-counter"></td>
                   <td><xsl:value-of select="author"/></td>
                   <td><xsl:value-of select="title"/></td>
                   <td><xsl:value-of select="genre"/></td>
                   <td><xsl:value-of select="price"/></td>
                   <td>
                     <xsl:call-template name="formatdate">
                       <xsl:with-param name="dateParam" select="publish_date"/>
                     </xsl:call-template>
                   </td>
                   <td>
                     <a href="#description"
                       class="btn waves-effect waves-light blue darken-4 modal-trigger"
                       data-author="{author}"
                       data-title="{title}"
                       data-genre="{genre}"
                       data-price="{price}"
                       data-publish_date="{publish_date}"
                       data-description="{description}" >
                       Description
                     </a></td>
                 </tr>
               </xsl:for-each>
             </tbody>
           </table>
         </div>

         <!-- Modal Structure -->
         <div id="description" class="modal bottom-sheet">
           <div class="modal-content">
             <h4 id="book-title"></h4>
             <div class="row">
               <div class="col s12"><strong>Author: </strong><span id="book-author"></span></div>
             </div>
             <div class="row">
               <div class="col s6"><strong>Genre: </strong><span id="book-genre"></span></div>
               <div class="col s6"><strong>Price: </strong><span id="book-price"></span></div>
             </div>
             <div class="row">
               <div class="col s12"><p id="book-description"></p></div>
             </div>
           </div>
         </div>

         <script src="js\jquery-2.2.3.min.js" charset="utf-8"></script>
         <script src="js/materialize.min.js" charset="utf-8"></script>
         <script src="js/main.js" charset="utf-8"></script>
       </body>
     </html>
  </xsl:template>
</xsl:stylesheet>
