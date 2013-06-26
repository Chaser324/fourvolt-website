
screenW = $("body").width()

$(window).scroll ->
    pos = $(window).scrollTop()
    if pos >= 50 and screenW > 767
        $('.navbar').addClass 'scrolled'
    else if screenW <= 767
        $('.navbar').addClass 'scrolled'
    else
        $('.navbar').removeClass 'scrolled'

$('.nav li a').click ->
    $('html, body').animate { scrollTop: $( $.attr(this, 'href') ).offset().top - 45 }, 400
    return false

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

$(window).on "resize orientationchange", ->
    screenW = $("body").width()
    pos = $(window).scrollTop()
    if screenW <= 767
        $('.navbar').addClass 'scrolled'
    else if pos >= 50 and screenW > 767
        $('.navbar').addClass 'scrolled'
    else 
        $('.navbar').removeClass 'scrolled'