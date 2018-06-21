


//= require jquery
//= require bootstrap
//= require rails-ujs
//= require jquery_ujs
//= require jquery-ui

//= require ./vendors/ofi
//= require ./vendors/slick.min
//= require ./vendors/select2.min
//= require ./vendors/jquery.waypoints.min
//= require ./vendors/lightgallery.min

//= require turbolinks
//= require_tree .
//= require jt_address
//= require filterrific/filterrific-jquery
//= require jquery-ui/widgets/datepicker

//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js

// This function is call when Google Maps is loaded
window.googleMapInitialize = function(){

    // Simple usage
    $('.jt-address-autocomplete').jt_address();

};
