// Generated by CoffeeScript 1.6.1
(function(){var e,t,n,r,i;t=function(e,t,n){$("#contact-form").hide();$("#contact-load").show();return!0};n=function(e,t,n,r){$("#contact-load").hide();return $("#contact-success").show()};e=function(e,t,n,r){$("#contact-load").hide();return $("#contact-form").show()};i=$("body").width();i<=767&&$(".navbar").addClass("scrolled");$(window).scroll(function(){var e;e=$(window).scrollTop();return e>=50&&i>767?$(".navbar").addClass("scrolled"):i<=767?$(".navbar").addClass("scrolled"):$(".navbar").removeClass("scrolled")});$(".nav li a").click(function(){$("html, body").animate({scrollTop:$($.attr(this,"href")).offset().top-45},400);$(".btn-navbar").click();return!1});navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)||(window.onscroll=function(){var e;if(i>767){e=Math.ceil($("body").scrollTop()/2);$("#header-content").css("-webkit-transform","translateY("+e+"px)");$("#header-content").css("-moz-transform","translateY("+e+"px)");return $("#header-inner").css("top",""+e*.9+"px")}});navigator.userAgent.match(/(iPad)/)&&(document.ontouchmove=function(){var e;if(i>767){e=Math.ceil($("body").scrollTop()/2.5);$("#header-content").css("-webkit-transform","translateY(-"+e+"px)");return $("#header-inner").css("top","-"+e*.8+"px")}});$(window).on("resize orientationchange",function(){var e;i=$("body").width();e=$(window).scrollTop();return i<=767?$(".navbar").addClass("scrolled"):e>=50&&i>767?$(".navbar").addClass("scrolled"):$(".navbar").removeClass("scrolled")});r=$(".fancybox");$(r).fancybox({padding:5,openEffect:"elastic",openSpeed:150,closeEffect:"elastic",closeSpeed:150,closeClick:!0,helpers:{overlay:{css:{background:"rgba(0, 0, 0, 0.5)"}}}});$("#contact-form").validate({submitHandler:function(e){return $(e).ajaxSubmit({beforeSubmit:t,success:n})},rules:{name:"required",email:{required:!0,email:!0},comments:"required"},errorClass:"error"})}).call(this);