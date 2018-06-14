##############################
# IMAGE LOADED
# called in imageLoadList
##############################

# https://jmperezperez.com/medium-image-progressive-loading-placeholder/
# https://www.sitepoint.com/how-to-build-your-own-progressive-image-loader/

####### load light image before load full image
class window.imageLoad

  constructor: (imageWrapper) ->
    if imageWrapper == null || imageWrapper == undefined
      return

    @$imageWrapper = imageWrapper

    @$imgLight       = @$imageWrapper.find('[data-is-image-light]')[0]

    @imgFullUrl      = @$imageWrapper.data('large')

    @replaceImages()


  replaceImages: ->
    imgLight = new Image()
    imgLight.src = @$imgLight.src

    imgLight.onload = =>
      $(@$imgLight).addClass 'loaded'

    imgFull = new Image()
    imgFull.src = @imgFullUrl
    $(imgFull).addClass 'img-load-full'

    imgFull.onload = =>
      $(imgFull).addClass 'loaded'

      # call object-fit image
      objectFitImages('.image-load-wrapper.image-load--cover img')


    @$imageWrapper.append imgFull

