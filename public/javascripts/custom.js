(function($) {

  // forbid IE 6
  if($.browser.msie && $.browser.version == "6.0") {
    window.location = "forbid_ie6";
  }

  // document ready
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
    
    // show edit button only on hover
    $(".post_edit_button").hide();
    $(".post_title").hover(function() {
      $(".post_edit_button", $(this)).show();
    }, function() {
      $(".post_edit_button", $(this)).hide();
    });

    // toggle visibility of post comments
    $(".comments_toggle_button").toggle(function() {
      $(this).data("original_text", $(this).text())
             .hide()
             .text("hide comments")
             .fadeIn()
             .next().slideDown();
    }, function() {
      $(this).hide()
             .text($(this).data("original_text"))
             .fadeIn()
             .next().slideUp();
    });

  });

})(jQuery);
