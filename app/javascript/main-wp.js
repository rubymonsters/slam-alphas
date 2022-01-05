document.addEventListener("DOMContentLoaded", function () {

  document.querySelector('body').classList.add('has-js');

  // tofuburger toggle
  var burger = document.querySelector('.logo-burger');
  var cross = document.querySelector('.navigation-button');
  var nav = document.querySelector('.l-navigation');

  burger.addEventListener('click', function () {
    nav.classList.toggle('is-open');
  });
  cross.addEventListener('click', function () {
    nav.classList.toggle('is-open');
  });

  if (document.querySelector('body').classList.contains('has-js')) {
    // alphabet list toggle
    var alphabetList = document.querySelector('.list-position-wrapper');
    var listClose = document.querySelector('.list-button');

    if (alphabetList) {
      alphabetList.classList.add('is-hidden');

      document.querySelectorAll('.l-alphabet a').forEach(link => {
        link.addEventListener('click', ev => {
          ev.preventDefault();

          if (document.querySelector('.slam-profile')) {
            document.querySelector('.slam-profile').classList.add('is-hidden');
          }
          if (document.querySelector('.slam-profile-video')) {
            document.querySelector('.slam-profile-video').classList.remove('is-open');
          }

          document.querySelector('.is-highlight')?.classList.remove('is-highlight');
          link.classList.add('is-highlight');
          alphabetList.classList.remove('is-hidden');
          // get clicked on letter
          let letter = link.getAttribute('href');
          // find letter section in the overall list and how far it is down
          let offsetInList = document.querySelector('.list-alphabet .title-main.'+ letter).offset().top;
          let offsetOfList = document.querySelector('.list-alphabet').offset().top;
          let sectionHeaderHeight =  $('.list-alphabet .title-main.'+ letter).height();
          let scrollTo = offsetOfList - (-1 * offsetInList) - sectionHeaderHeight;

          document.querySelector('.list-alphabet')
            .scroll({top: scrollTo, left: 0, behaviour: 'smooth'});
        });
      });

      listClose.addEventListener('click', function () {
        alphabetList.classList.add('is-hidden');
      });
    }

    // profile toggle
    var profileElem = document.querySelector('.slam-profile');
    var videoElem = document.querySelector('.slam-profile-video');
    var profileClose = document.querySelector('.profile-close');
    var videoClose = document.querySelector('.video-close');
    var videoOpen = document.querySelector('.js-open-video');

    if (profileElem && profileClose) {
      profileClose.addEventListener('click', function () {
        var url = document.querySelector('.map-nav .active').getAttribute('href');
        location = url;
      });
    }

    if (videoElem && videoClose && videoOpen) {
      videoClose.addEventListener('click', function () {
        videoElem.classList.remove('is-open');
      });
      videoOpen.addEventListener('click', function (ev) {
        ev.preventDefault();
        videoElem.classList.toggle('is-open');
      });
    }

    // hide flash messages
    document.querySelectorAll('.flashes .flash-close').forEach(closeBtn => {
      closeBtn.addEventListener('click', ev => {
        closeBtn.closest('.flash').remove();
      });
    });
  }
});
