
$(window).scroll ->
    pos = $(window).scrollTop()

    if pos >= 50
        $('.navbar').addClass 'scrolled'
        $('body').css 'padding-top', '0px'
    else
        $('.navbar').removeClass 'scrolled'
        $('body').css 'padding-top', '0px'
