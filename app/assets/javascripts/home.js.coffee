# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#tabs").tabs
    show: false
    activate: -> $('.carousel').trigger('updateSizes')

  $('.left-form select').selectmenu
    width: 336

  $('.main-carousel').carouFredSel
    circular: true,
    infinite: true,
    responsive: true,
    height: 350,
    width: '100%',
    align: 'center',
    items:
      visible: 1,
      height: 350,
      minimum: 1
    auto: true,
    swipe: true

  $('.clients-carousel').carouFredSel
    circular: true,
    infinite: true,
    responsive: true,
    height: 'auto',
    width: 840,
    items:
      visible: 4,
      width: 266,
      height: 175,
      minimum: 1
    scroll:
      items: 1
    auto: true,
    swipe: true

  $.each $('.tab'), () ->
    tab = $(this)
    $('#' + tab.attr('id'))
      .find('.carousel')
      .carouFredSel
        circular: false,
        infinite: false,
        width: 840,
        align: false,
        items:
          visible: 1,
          width: 840,
          minimum: 1
        auto: false,
        prev:
          button: -> tab.find('.projects-pager-left')
        next:
          button: -> tab.find('.projects-pager-right')
        swipe: true