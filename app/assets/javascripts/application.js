// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// AUTOMATIC SLIDESHOW
function slideshow() {
    var i;
    var x = document.getElementsByClassName("slides");
    var y = document.getElementsByClassName("slide-text");

    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
       y[i].style.display = "none";
    }
    slideIndex++;

    if (slideIndex > x.length) {slideIndex = 1}
    if (slideIndex < 1) {slideIndex = x.length}

    x[slideIndex-1].style.display = "block";
    y[slideIndex-1].style.display = "block";

    setTimeout(slideshow, 6000); // Change image every 2 seconds
}

function myMap() {
  var coord = {lat: 53.3488224, lng: -6.2437119};
  var map = new google.maps.Map(document.getElementById('map'),
    {zoom: 16,
    center: coord
    });
  var marker = new google.maps.Marker({
    position: coord,
    map: map
  });
}
