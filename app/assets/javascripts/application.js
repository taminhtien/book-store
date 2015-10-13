// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree
//= require bootstrap

$(document).ready(function () {
  $('a.leave-review').click(function(event){
    event.preventDefault();
    $('div#review-form').toggle();
  });

  // Get rating score as read only
  $('.star-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

  // Load rating score as star to choose
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });

  $('a[data-remote=true]').live('ajax:before', function () {
     if ($(this).attr('ajax-loading')) {
       return false;
     } else {
       $(this).attr('ajax-loading', true);
     }
  }).live('ajax:complete', function () {
    $(this).removeAttr('ajax-loading');
  });
});