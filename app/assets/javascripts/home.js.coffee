# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#tabs").tabs
    show: false
    activate: -> $('.carousel').trigger('updateSizes')

  $('.main-carousel').carouFredSel
    debug: true,
    circular: true,
    infinite: true,
    responsive: true,
#    height: 350,
    width: '100%',
    align: 'center',
    items: {
      visible: 1,
#      width: '100%',
#      height: 350,
      minimum: 1
    },
    auto: true,
    swipe: true

  $.each $('.tab'), () ->
    tab = $(this)
    $('#' + tab.attr('id'))
      .find('.carousel')
      .carouFredSel
        debug: true,
        circular: false,
        infinite: false,
        width: 840,
        align: false,
        items: {
          visible: 1,
          width: 840,
          minimum: 1
        },
        auto: false,
        prev:
          button: -> tab.find('.projects-pager-left')
        next:
          button: -> tab.find('.projects-pager-right')
        swipe: true