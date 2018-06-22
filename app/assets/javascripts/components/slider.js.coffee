####################
## SLIDER
################################################################################
# init one slider
class @Slider

  constructor: (@item, options = {}) ->

    defaultOptions = {
      dots: true
      arrows: true
      infinite: true
      speed: 500
      autoplay: true
      autoplaySpeed: 5000
      pauseOnHover: false
      pauseOnFocus: false
    }

    @options = $.extend(true, {}, defaultOptions, options)

    @init()


  init: ->
    self = this
    @item.slick( self.options)
    @reinitAfterDestroy()


  # if slider is unslick on a certain breakpoint,
  # re-create it if the breakpoint is reached again
  # https://engineering.growella.com/reinit-slick-carousel/
  reinitAfterDestroy: () ->

    # listen destroy event
    @item.on('destroy', (ev, slick) ->
      carousel = $(this)

      # reinit slider if window.width < slick breakpoint
      reinit = debounce((->

        # slick.activeBreakpoint will tell us the breakpoint at which the carousel was destroyed.
        # if breakpoint is superior to innerwidth we return
        # (because sider is destroyed on mobile screen)
        # else, reinit slider
        if slick.activeBreakpoint > window.innerWidth
          return

        # Re-initialize with the old settings.
        carousel.slick slick.options
        # Remove this event listener.
        window.removeEventListener 'resize', reinit
        return
      ), 500)
      # Assign our debounced callback to window.resize.
      window.addEventListener 'resize', reinit
      return
    )


# deboune function, to avoid call to much time resize event
# https://davidwalsh.name/javascript-debounce-function
debounce = (func, wait, immediate) ->
  timeout = undefined
  ->
    context = this
    args = arguments

    later = ->
      timeout = null
      if !immediate
        func.apply context, args
      return

    callNow = immediate and !timeout
    clearTimeout timeout
    timeout = setTimeout(later, wait)
    if callNow
      func.apply context, args
    return
