var ready = function() {
  //User outerHeight to get total div height, pass true to inclue margins
  var postShowcaseHeight = $(".post-showcase").outerHeight(true);

  function getCurrentPostId(){
    // Divide users location on a page by the height of each div, rounded up to the nearest whole number.
    // Add one so that we always have a non-zero number, since the CSS we rely on is 1-indexed
    return ($(document).scrollTop() / Math.ceil(postShowcaseHeight)) + 1;
  };


  $(".next-arrow").on("click",function() {
    var curPostId = getCurrentPostId();
    // Find the offset of the top-most fully visible element.
    // If a post is even partially cut off, this will advance to the next element.
    var elementOffset = $(".posts .post-showcase:nth-child(" + (Math.round(curPostId+1)) + ")").offset();
    // Math to make sure the amount the page moves is a direct multiple of postShowcaseHeight.
    // Using this, we avoid concatenating minor rounding errors
    var roundedOffset = postShowcaseHeight * Math.round(elementOffset.top / postShowcaseHeight);
    // Finally, smoothly scroll the amount of pixels that we had defined
    $("html, body").animate({scrollTop: (roundedOffset)});
  });
};

$(document).ready(ready);
