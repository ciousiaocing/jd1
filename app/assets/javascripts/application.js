// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap/dropdown
//= require autosize.min
//= require jquery.countdown.min
//= require wow.min
//= require bootstrap/carousel
//= require_tree .

$(document).ready(function(){
  new WOW().init();

  //navbar
  $(window).scroll(function(){
    if ($(this).scrollTop() > 125) {
      $('#navbar').addClass('show_bgcolor')
    } else {
      $('#navbar').removeClass('show_bgcolor')
    }
  })
  //index carousel picture
  $('#myCarousel').carousel({interval: 2000});
  $('#start-buy').click(function(){
    $('html, body').scrollTop(600);
  })

  //product.index
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
})
