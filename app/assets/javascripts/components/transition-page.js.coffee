
class @TransitionPage
#### on click on a link, prevent default to show animation of the backdrop

  constructor: ->
    @$linkTransition = $('[data-trigger-transition-page]')

    @$wrapper = $('body')
    @leaveClass = 'content-leave'
    @loadedClass = 'content-loaded'

    @delayTransition = 700  # ms, to check with the css

    @reinitTransitionClass()
    @bindEvents()
    @loadBody()



  bindEvents: () ->
    self = this

    @$linkTransition.on 'click', (evt)->
      # if there is a wrong informations on the link, return
      if $(this).attr('href') == null || $(this).attr('href') == undefined || $(this).attr('href') == "#"
        return
      else

        # if there is a special key pressed, return
        # ctrl key : Control key (on Windows)
        # altKey : Alt key
        # shiftKey: Shift Key
        # metaKey : Command on Mac, Windows on Windows
        if (evt.ctrlKey || evt.altKey || evt.shiftKey || evt.metaKey)
          return
        # if this is a normal click, we create the transition page
        else
          evt.preventDefault()
          self.$wrapper.addClass self.leaveClass

          newHref = $(this).attr('href')

          window.setTimeout (->
            window.location.href = newHref
          ), self.delayTransition


  #### check if all images are loaded (consider that in that case, the document is loaded)
  loadBody: () ->
    @$wrapper.addClass @loadedClass


  #### reinit body class, usefull if click on prev navigator button -> body classes can stay on
  #### state when the page was leaving
  reinitTransitionClass: () ->
    self = this
    @$wrapper.removeClass(self.loadedClass).removeClass(self.leaveClass)