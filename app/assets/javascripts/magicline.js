$(function() {
    var menuElements1 = $('#nav li'),
        menuElements2 = $('.ui-tabs-nav li'),
        menuContainer1 = $('.navigation'),
        menuContainer2 = $('.portfolio'),
        menuCursor1 = $('.menu-cursor1'),
        menuCursor2 = $('.menu-cursor2'),
        cursorIsOut = false;

    var cursorIn = function(event, obj, cursor) {
        cursorIsOut = true;
        var t = $(obj),
            cursorMargin = 0;

        if (cursor == menuCursor1) {
            cursorMargin = cursor.width() / 2;
        }

        cursor.addClass('transition');
        cursor.offset({left: t.offset().left + cursorMargin});
        event.stopPropagation();
        },

        cursorOut = function (event, container, cursor) {
            if (cursorIsOut) {
                cursor.offset({left: container.width()});
                cursor.one('transitionend', function() {
                    cursor.removeClass('transition');
                    cursor.offset({left: 0 - cursor.width()});
                });
                cursorIsOut = false;
            }
        };

    menuCursor1.offset({left: 0 - menuCursor1.width()});
    menuCursor2.offset({left: 0 - menuCursor2.width()});

    menuElements1.on('mouseover mouseout', function() {
        cursorIn(event, this, menuCursor1)
    });
    menuElements2.on('mouseover mouseout', function() {
        cursorIn(event, this, menuCursor2)
    });

    menuContainer1.on('mouseover', function() {
        cursorOut(event, menuContainer1, menuCursor1)
    });
    menuContainer2.on('mouseover', function() {
        cursorOut(event, menuContainer2, menuCursor2)
    });

    

});