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

    // faq accordion
    var heads = document.querySelectorAll('.accordion-h');
    var bodies = document.querySelectorAll('.accordion-b');

    bodies.forEach(function(item) {
      item.classList.add('is-hidden');
    });

    for (var i = 0; i < heads.length; i++) {
      heads[i].addEventListener('click', function (el) {
        this.classList.toggle('is-open');
        this.nextElementSibling.classList.toggle('is-hidden');
      });
    }

    // alphabet list toggle

    var alphabetList = document.querySelector('.list-alphabet');
    var listClose = document.querySelector('.list-button');

    if (alphabetList) {
      alphabetList.classList.add('is-hidden');

      $('.l-alphabet a').on('click', function (ev) {
        ev.preventDefault();
        alphabetList.classList.remove('is-hidden');
        // get clicked on letter
        var letter = $(this).attr('href');
        // find letter section in the overall list and how far it is down
        var offsetInList = $('.list-alphabet .title-main.'+ letter).offset().top;
        var offsetOfList = $('.list-alphabet').scrollTop();
        // scroll to that point!
        var sectionHeaderHeight =  $('.list-alphabet .title-main.'+ letter).height();
        $('.list-alphabet').scrollTop(offsetOfList - (-1 * offsetInList) - sectionHeaderHeight);
      });

      listClose.addEventListener('click', function () {
        alphabetList.classList.add('is-hidden');
      });
    }



    // profile toggle
    var profileElem = document.querySelector('.slam-profile');
    var profileClose = document.querySelector('.profile-button');

    if (profileElem && profileClose) {
      profileClose.addEventListener('click', function () {
        profileElem.classList.add('is-hidden');
      });
    }
  }
});
