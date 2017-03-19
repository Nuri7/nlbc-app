$(document).ready(function($) {
"use strict";

  /*-------------------------------------------------*/
  /* = slider Testimonial
  /*-------------------------------------------------*/

  var slidertestimonial = $('.bxslider');
  try{    
    slidertestimonial.bxSlider({
      mode: 'horizontal'
    });
  } catch(err) {
  }


/* Mobile Detect */
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};

/* Parallax */
var Parallax = function(){
    jQuery(".parallax").each(function() {
        var parallaxId = $(this).attr('id');
        $('#'+parallaxId).parallax("50%", 0.4);
    });
}



$(document).ready(function() {

    Parallax();

    /* Mobile Menu */
    $('.navigate').slicknav();
    /* Mobile Menu */

    /* Flexslider */
    $('.flexslider-thumb').flexslider({
        animation: "slide",
        animationLoop: false,
        prevText: "",
        nextText: "",
        controlNav: "thumbnails"
    });



});
$(window).load(function(){
  $('.flexslider').flexslider({
    animation: "slide",
    animationLoop: false,
    prevText: "",
    nextText: "",
    start: function(slider) {
      $('.flexslider').removeClass('slider-loading');
    }
  });  
});

})(jQuery);