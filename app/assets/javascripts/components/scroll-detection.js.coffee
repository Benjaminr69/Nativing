####################
## SCROLL DETECTION
################################################################################

class @ScrollDetection

  constructor: ->

    @$scrollElement = $('[data-is-scroll]')

    @activeClass = 'scroll-in'

    @offset = '90%'

    @bindEvents()

    return


  bindEvents: ->
    self = this

    @$scrollElement.waypoint ( (direction) ->
      # on récupère l'élément
      selectorElement = $(this).map( -> this.element).get()
      element = $(selectorElement)

      if direction == 'down'
        element.addClass self.activeClass
      # else
      #   element.removeClass self.activeClass
      return
    ), offset: self.offset

    return