
(function ($) {

  "use strict";

  // AOS ANIMATIONS
  AOS.init();

  // NAVBAR
  $('.navbar-nav .nav-link').click(function () {
    $(".navbar-collapse").collapse('hide');

  });

  // NEWS IMAGE RESIZE
  function NewsImageResize() {
    $(".navbar").scrollspy({ offset: -76 });

    var LargeImage = $('.large-news-image').height();

    var MinusHeight = LargeImage - 6;

    $('.news-two-column').css({ 'height': (MinusHeight - LargeImage / 2) + 'px' });
  }

  $(window).on("resize", NewsImageResize);
  $(document).on("ready", NewsImageResize);

  // $('a[href*="#"]').click(function (event) {
  //   if (
  //     location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
  //     var target = $(this.hash);
  //     target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
  //     if (target.length) {
  //       event.preventDefault();
  //       $('html, body').animate({
  //         scrollTop: target.offset().top - 66
  //       }, 1000);
  //     }
  //   }
  // });

  /*
    어느정도 스크롤하면 TOP버튼 나타내게하기
  */
  $(".top-btn").hide();

  // fade in #back-top
  $(function () {
    $(window).scroll(function () {
      if ($(this).scrollTop() > 500) {
        $('.top-btn').fadeIn();
      } else {
        $('.top-btn').fadeOut();
      }
    });

    // scroll body to 0px on click
    $('.top-btn a').click(function () {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  });
})(window.jQuery);


