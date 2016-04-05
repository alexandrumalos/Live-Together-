//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
// I don't want to use CoffeeScript. I'll use JavaScript instead. -Ben

function toggle_comments(id){
  $('#comments-section-' + id).slideToggle();
}
