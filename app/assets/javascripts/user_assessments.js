jQuery(function() {
  $('#progress').css('width', '900px');
  $('#progress').css('height', '35px');

  $(".accordion-inner input").on('click', function(){
    var total = parseInt($('#progress').css("width").match(/\d+/)),
      answer_val = total/parseInt(progress_bar),
      cur_progress = $('.accordion-inner input:checked').length;
    $('#myprogress').css('width', (cur_progress * answer_val) + "px");

    blockFinished($(this).closest('.accordion-body').attr('id'));
  });

  function blockFinished(block_id) {
    var questions = $('#' + block_id + ' .accordion-inner');

    if ($(questions).find('dl').length == $(questions).find('dl input:checked').length){
      $('#' + block_id).removeClass('in');

      var blocks_arr = $('.accordion-body'),
        blocks_arr_ids = [];
      $.each(blocks_arr, function( index, value ) {
        if ($(value).attr('id') != block_id){
          blocks_arr_ids.push(value);
        }
      });
      $(blocks_arr_ids[0]).addClass('in')
    }

  };
});
