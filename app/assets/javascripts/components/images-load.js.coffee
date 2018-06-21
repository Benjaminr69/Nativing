##############################
# IMAGE LOADED LIST
##############################

######### GENERATE EACH IMAGE LOAD ITEMS
class @imageLoadList

  constructor: ->
    $("[data-is-image-wrapper]").each ->
      new window.imageLoad($(this))
