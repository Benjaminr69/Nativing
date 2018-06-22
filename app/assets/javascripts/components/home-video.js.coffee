##################
## TRIGGER VIDEO
##################
class @HomeVideo

  constructor: ->

    @$PlayButton = $('[data-trigger-video]')

    @bindEvents()

  bindEvents: ->
    self = this

    self.$PlayButton.click ->
      $('[data-is-teaser]').toggleClass 'open'
    return