$(document).ready(function() {
    var o = $('#nav li'),
        ml = $('.menu-cursor'),
        c = $('.navigation'),
        cursorIsOut = false;

    ml.offset({left: 0 - ml.width()});

    o.on('mouseover mouseout', function(event) {
        cursorIsOut = true;
        var t = $(this);
        ml.addClass('transition');
        ml.offset({left: t.offset().left + ml.width() / 2});
        event.stopPropagation();
    });

    c.on('mouseover', function() {
        if (cursorIsOut) {
            ml.offset({left: c.width()});
            ml.one('transitionend', function() {
                ml.removeClass('transition');
                ml.offset({left: 0 - ml.width()});
            });
            cursorIsOut = false;
        }
    });
});