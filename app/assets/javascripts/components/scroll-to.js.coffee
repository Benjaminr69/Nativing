##################
## SCROLL TO
##################
# Animated scroll To
class @ScrollTo

  constructor: ->
    self = this
    @selectorScrollTo = '[data-trigger-smooth-scroll]'

    if $(document).find(self.selectorScrollTo).length != 0
      @bindEvents()


  bindEvents: ->
    self = this

    $(self.selectorScrollTo).click (e) ->
      e.preventDefault()
      self.animateScrollTo($(this), $(this).attr('href'), 600, 1)



  # entrée : l'élément sur lequel on clique, élément cible, vitesse(ms), offsetTop (px)
  animateScrollTo: (elLink, elTarget, speed, offsetTop) ->
    # Au clic sur un élément
    $('html, body').animate { scrollTop: $(elTarget).offset().top + offsetTop}, speed
    # Go
    false