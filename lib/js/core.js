    var swiper = new Swiper('.swiper-container', {
      autoplay: {
        delay: 4000,
        disableOnInteraction: false,
        
      },
      pagination: {
        el: '.swiper-pagination',
        // type: 'fraction',
        type: 'bullets',
        clickable: true
      },
      navigation: {
        nextEl: '.swiper-next',
        prevEl: '.swiper-prev',
      },
    });

  $(window).scroll(function () {
    // if ($(this).scrollTop() > $('.header').outerHeight()) {
    if ($(this).scrollTop() > 1) {
      $('.navbar-home').addClass('bxs-1');
    } else {
      $('.navbar-home').removeClass('bxs-1');
    }
  });

particlesJS.load('particles-js', 'lib/js/particles.json', function() {
  console.log('callback - particles.js config loaded');
});

$(".header").hover3d({
  selector: ".header-content",
  sensitivity: 50
});

const player = new Plyr('#player');
$('.parallax').parallax({imageSrc: 'lib/img/bg.jpg'});


var footHG = $('.footer-content').outerHeight();
$('.footer-shape').css('height',footHG);