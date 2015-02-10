$(document).on('change', '.modal-body input[type="checkbox"]', function() {
  $('input[name="' + this.name + '"]').not(this).prop('checked', false);
  if($('#category_level_one').is(':checked') == true){
    $('.quizz-level-section').show();
  } else {
    $('.quizz-level-section').hide();
  }
});

$(function(){
  if($('#category_level_one').is(':checked') == true){
    $('.quizz-level-section').show();
  } else {
    $('.quizz-level-section').hide();
  }
});