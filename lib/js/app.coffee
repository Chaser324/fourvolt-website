
$(window).scroll ->
    pos = $(window).scrollTop()

    if pos >= 50
        $('.navbar').addClass 'scrolled'
        $('body').css 'padding-top', '0px'
    else
        $('.navbar').removeClass 'scrolled'
        $('body').css 'padding-top', '0px'

$('.nav li a').click ->
    $('html, body').animate { scrollTop: $( $.attr(this, 'href') ).offset().top - 45 }, 400
    return false

screenW = $("body").width()

if !navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)
    window.onscroll = ->
        if screenW > 767
            n = Math.ceil $("body").scrollTop() / 2.0
            $('#header-content').css "-webkit-transform", "translateY(" + n + "px)"
            $('#header-content').css "-moz-transform", "translateY(" + n + "px)"
            $('#header-inner').css "top", "" + (n * 0.9) + "px"
       
if navigator.userAgent.match(/(iPad)/)
    document.ontouchmove = ->
        if screenW > 767
            n = Math.ceil $("body").scrollTop() / 2.5
            $('#header-content').css "-webkit-transform", "translateY(-" + n + "px)"
            $('#header-inner').css "top", "-" + (n * 0.8) + "px"
