####################
## INPUT SMOOTH
################################################################################

# https://stackoverflow.com/questions/35049555/chrome-autofill-autocomplete-no-value-for-password
# https://stackoverflow.com/questions/11708092/detecting-browser-autofill
# https://stackoverflow.com/questions/1481152/how-to-detect-a-textboxs-content-has-changed

class @InputSmooth

  # CONSTRUCTOR
  constructor: ->
    self = this

    @selectorSmooth = '[data-is-input-smooth]'
    @$inputSmooth = $(@selectorSmooth)
    @filledClass = 'input--filled'

    # search input smooth on DOM before launch actions
    if $(document).find(self.selectorSmooth).length > 0

      # check on construction if an input is already filled or not
      # bug on saved password on IE 10
      self.$inputSmooth.each ->

        # standard check ; on load, check if an input is filled
        if $(this).val().trim() != ''
          self.onInputFilled($(this))


        # special check for chrome autofill (saved password) when page is loaded
        # make it in a try because pseudo-selector ":-webkit-autofill" is only recognized by webkit browsers and throw errors on other browsers
        else
          # only check on password type, because other types doesn't bug
          if $(this).attr('type') == 'password'
            inputCurrent = $(this)
            setTimeout (->
              try
                if inputCurrent.is(':-webkit-autofill')
                  self.onInputFilled(inputCurrent)
            ), 100
            return

      # bind events
      @bindEvents()

    return


  # BIND EVENTS
  # on focus & on leave
  bindEvents: ->
    self = this

    # bind events for each input
    @$inputSmooth.each ->
      # on focus input add filledClass
      # input event for autofilled forms (like saved passwords) when user enter his-her mail
      $(this).on 'input focus', ->
        self.onInputFilled($(this))

      # on leave input; check if input is filled. if not filled, remove filledclass
      $(this).on 'blur', ->
        if $(this).val().trim() == ''
          self.onInputEmpty($(this))



  onInputFilled: (input) ->
    input.addClass @filledClass


  onInputEmpty: (input) ->
    input.removeClass @filledClass
