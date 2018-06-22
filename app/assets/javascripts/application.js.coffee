


#= require jquery
#= require bootstrap
#= require rails-ujs
#= require jquery-ui

#= require ./vendors/ofi
#= require ./vendors/slick.min
#= require ./vendors/select2.min
#= require ./vendors/jquery.waypoints.min
#= require ./vendors/lightgallery.min

#= require turbolinks
#= require_tree .
#= require jt_address


# // This function is call when Google Maps is loaded
# // window.googleMapInitialize = function(){

# //     // Simple usage
# //     $('.jt-address-autocomplete').jt_address();

# // };


$ ->

  new HeaderActive()

  new ImageObjectFit()

  new imageLoadList()

  new ScrollTo()
