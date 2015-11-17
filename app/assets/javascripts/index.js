var ready = function() {
  var i = 2; // incrementor for the next arrow
  var postShowcaseHeight = $(".post-showcase").height();
  var previousScroll =
  $(window).on("scroll",function(event){
    var scrollPos = $(document).scrollTop();
    var atId = Math.ceil(scrollPos / postShowcaseHeight);
    //var atId = Math.round(scrollPos / postShowcaseHeight) + 1;
    console.log(atId);
    i = atId;
  });


  // scroll to the next post
  $(".next-arrow").on("click",function() {
    var p = $(this);
    var newOffset = $(".posts .post-showcase:nth-child(" + i + ")").offset()
    $("html, body").animate({scrollTop: (newOffset.top - 200)});
    i++;
  });
};

$(document).ready(ready);
