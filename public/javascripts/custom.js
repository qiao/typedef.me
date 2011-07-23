function show_comments_of_commentable_id(id) {
  $("#comments_" + id).slideDown();
  $("#comments_show_link_" + id).hide();
  $("#comments_hide_link_" + id).fadeIn();
}

function hide_comments_of_commentable_id(id) {
  $("#comments_" + id).slideUp();
  $("#comments_hide_link_" + id).hide();
  $("#comments_show_link_" + id).fadeIn();
}

/*
window.onload = function() {
  $("img").lazyload({
    //effect: "fadeIn"
  })
}  
*/
