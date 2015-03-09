jQuery(function() {
  $('#progress').css('width', '900px');
  $('#progress').css('height', '35px');

  $(".accordion-inner input").on('click', function(){
    var total = parseInt($('#progress').css("width").match(/\d+/)),
      answer_val = total/parseInt(progress_bar),
      cur_progress = $('.accordion-inner input:checked').length;
    $('#myprogress').css('width', (cur_progress * answer_val) + "px");
  });
});