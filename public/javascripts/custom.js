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

$(function() {
  // lazyload gravatar images
  $(".gravatar_image").lazyload({
    placeholder: "/images/default_gravatar.png",
    effect: "fadeIn"
  });

  // load local links locally and load off-site links in a new tab
  $("a").attr("target", function() {
    if (this.host == location.host) 
      return "_self";
    else
      return "_blank";
  });

});
