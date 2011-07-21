function show_comments_of_commentable_id(id) {
  $("#comments_list_" + id).slideDown();
  $("#comments_show_button_" + id).fadeOut();
}

function hide_comments_of_commentable_id(id) {
  $("#comments_list_" + id).slideUp();
  $("#comments_show_button_" + id).fadeIn();
}
