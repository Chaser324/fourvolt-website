
contactSubmit = (formData, jqForm, options) ->
    $('#contact-form').hide()
    $('#contact-load').show()
    return true

contactSuccess = (responseText, statusText, xhr, $form) ->
    $('#contact-load').hide()
    $('#contact-success').show()

contactFail = (responseText, statusText, xhr, $form) ->
    $('#contact-load').hide()
    $('#contact-form').show()


screenW = $("body").width()

if screenW <= 767
    $('.navbar').addClass 'scrolled'

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
    $('.btn-navbar').click()
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

images = $(".fancybox")
$(images).fancybox
    padding: 5
    openEffect: 'elastic'
    openSpeed: 150
    closeEffect: 'elastic'
    closeSpeed: 150
    closeClick: true
    helpers:
        overlay:
            css:
                'background': 'rgba(0, 0, 0, 0.5)'

$('#contact-form').validate
    submitHandler: (form) ->
        $(form).ajaxSubmit
            beforeSubmit: contactSubmit,
            success: contactSuccess
    rules:
        name: "required"
        email:
            required: true
            email: true
        comments: "required"
    errorClass: "error"
