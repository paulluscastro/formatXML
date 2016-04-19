$(document).ready(function(){
    $('.modal-trigger').on('click', function(event){
      debugger;
      event.preventDefault();
      event.stopPropagation();

      $('#book-title').html($(this).attr('data-title'));
      $('#book-author').html($(this).attr('data-author'));
      $('#book-genre').html($(this).attr('data-genre'));
      $('#book-price').html($(this).attr('data-price'));
      $('#book-publish_date').html($(this).attr('data-publish_date'));
      $('#book-description').html($(this).attr('data-description'));

      $('#description').openModal();
    });
});
