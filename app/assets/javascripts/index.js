var ready = function() {
  //var i = 2; // incrementor for the next arrow
  var postShowcaseHeight = $(".post-showcase").height();
  function getCurrentPostId(){
    var scrollPos = $(document).scrollTop();
    console.log("current scrollPos = ", scrollPos);
    var atId = Math.ceil((scrollPos / postShowcaseHeight)) + 1;
    return atId;
  };

  // scroll to the next post
  $(".next-arrow").on("click",function() {
    var curPostId = getCurrentPostId();
    console.log("currently at ", curPostId, " scrolling to ", curPostId);
    var p = $(this);
    var newOffset = $(".posts .post-showcase:nth-child(" + (curPostId) + ")").offset();
    $("html, body").animate({scrollTop: (newOffset.top)});
  });
};

$(document).ready(ready);
