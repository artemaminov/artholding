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
    circular: false,
    infinite: false,
    responsive: true,
    height: 'auto',
#    width: 840,
    items:
      visible: 3,
      width: 280,
      height: 175,
      minimum: 3
    scroll:
      items: 1
    auto: false,
    prev:
      button: -> $('.clients-pager .projects-pager-left')
    next:
      button: -> $('.clients-pager .projects-pager-right')
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

  $(window).scroll ->
    window_top = $(window).scrollTop()
    div_top = $('.artholding-logo').offset().top + 212
    console.log("div_top", div_top, "window_top", window_top)
    if (window_top > div_top)
      $('.navigation').addClass('stick header-bg')
    else
      $('.navigation').removeClass('stick header-bg')

  $("#nav a").click (evn) ->
    evn.preventDefault()
    $('html,body').scrollTo(this.hash, 500, {offset: -90})