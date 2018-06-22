##################
## HEADER ACTIVE
##################
class @HeaderActive

  constructor: ->

    @$NavActiveWrapper = $('[data-is-nav]')

    @bindEvents()

  bindEvents: ->
    self = this

    self.$NavActiveWrapper.hover ->
      $(this).toggleClass 'nav--gray'
    return
