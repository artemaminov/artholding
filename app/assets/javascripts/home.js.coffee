# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Portfolio tabs
  $("#tabs").tabs
    show: false
    activate: -> $('.carousel').trigger('updateSizes')

  # Portfolio AJAX Project open
  $(".project a[data-remote]")
    .on 'ajax:send', (e, data, status, xhr) ->
      $('.project-modal')
        .css("left", "9999px")
        .animate({ left: "0"}, 800)
  # Send order request
  $(".order .form form")
    .on 'ajax:success', (e, data, status, xhr) ->
      $('.order .form').addClass("hidden")
      $('.order .order-complete').addClass("visible")

  # Page scrolling main navbar bar
  $(window).scroll ->
    window_top = $(window).scrollTop()
    div_top = $('.artholding-logo').offset().top + 212
    if (window_top > div_top)
      $('.navigation').addClass('stick header-bg')
    else
      $('.navigation').removeClass('stick header-bg')

  # Main navbar section follow
  $("#nav a").click (evn) ->
    evn.preventDefault()
    $('html,body').scrollTo(this.hash, 500, {offset: -70})

  # Order request form dropdown menu
  $('.left-form select').selectmenu
    width: 336
    position:
      my: "left top+8"
      at: "left bottom"
      collision: "none"

  # Carousels
  $(".main-carousel").carouFredSel
    circular: true
    infinite: true
    responsive: true
    height: 350
    width: '100%'
    align: 'center'
    items:
      visible: 1
      height: 350
      minimum: 2
    pagination:
      container: ".main-carousel-pager"
      anchorBuilder: (nr) ->
        '<a href="#'+nr+'"></a>'
    auto:    {
      timeoutDuration: 6000
    }
    swipe: true

  $(".clients-carousel").carouFredSel
#    circular: true
#    infinite: true
    responsive: true
    align: "center"
#    height: 150
    width: 840
    items:
      visible: 4
      width: 210
#      height: 150
      minimum: 5
    scroll:
      items: 1
      queue : "last"
    auto: false
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
        circular: false
        infinite: false
        width: 840
        align: false
        items:
          visible: 1
          width: 840
          minimum: 1
        auto: false
        prev:
          button: -> tab.find('.projects-pager-left')
        next:
          button: -> tab.find('.projects-pager-right')
        swipe: true
