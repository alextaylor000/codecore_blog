var hideCommentEdit = function(selector) {
  $("#"+ selector).slideDown(250);
  $("#"+ selector +"-edit").fadeOut(250, function() { $(this).remove(); });
};
