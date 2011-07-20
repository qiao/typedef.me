function show_comments_of_commentable_id(id) {
  $("#commentable_" + id + "_comments").slideDown();
  $("#comments_show_button_" + id).fadeOut();
}

function hide_comments_of_commentable_id(id) {
  $("#commentable_" + id + "_comments").slideUp();
  $("#comments_show_button_" + id).fadeIn();
}
