####################
## SLIDERS
################################################################################
# for each slider found in the markup, init one Slider
class @Sliders

  constructor: ->
    self = this

    @attribute = 'data-is-slider'
    @selector = '['+@attribute+']'

    if $(document).find(self.selector).length > 0
      self.init()


  init: ->
    self = this
    $(self.selector).each ->

      options = $(this).attr(self.attribute)

      if options != null && options != '' && options != undefined

        options = JSON.parse(options)

      new Slider($(this), options)




