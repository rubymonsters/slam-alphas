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
    var listTrigger = document.querySelectorAll('.l-alphabet a');
    var listClose = document.querySelector('.list-button');

    if (alphabetList) {
      alphabetList.classList.add('is-hidden');

      listTrigger.forEach(function(trigger) {
        trigger.addEventListener('click', function (ev) {
          ev.preventDefault();
          alphabetList.classList.remove('is-hidden');
        });
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
