// Generated by CoffeeScript 1.6.3
(function(){var e,t,n,r,i,s;t=function(e,t,n){$("#contact-form").hide();$("#contact-load").show();return!0};n=function(e,t,n,r){$("#contact-load").hide();return $("#contact-success").show()};e=function(e,t,n,r){$("#contact-load").hide();return $("#contact-form").show()};r=new Date;$(".current-date").text(r.getFullYear());s=$("body").width();s<=767&&$(".navbar").addClass("scrolled");$(window).scroll(function(){var e;e=$(window).scrollTop();return e>=250&&s>767?$(".navbar").addClass("scrolled"):s<=767?$(".navbar").addClass("scrolled"):$(".navbar").removeClass("scrolled")});$(".nav li a").click(function(){$("html, body").animate({scrollTop:$($.attr(this,"href")).offset().top-45},400);$(".btn-navbar").click();return!1});$(".footer-nav a").click(function(){$("html, body").animate({scrollTop:$($.attr(this,"href")).offset().top-45},400);return!1});navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)||(window.onscroll=function(){var e,t;if(s>767&&!$("body").hasClass("demo")){e=Math.ceil($("body").scrollTop()/2);t=150-e*1.5;$("#header-content").css("-webkit-transform","translateY("+e+"px)");$("#header-content").css("-moz-transform","translateY("+e+"px)");$("#header-inner").css("top",""+e*.9+"px");$("#sun").css("bottom",""+t+"px");return t<=50?$("#home").addClass("night"):$("#home").removeClass("night")}if($("body").hasClass("demo")){e=Math.ceil($("body").scrollTop()/2);t=150-e*1.5;$("#sun").css("bottom",""+t+"px");return t<=50?$("#home").addClass("night"):$("#home").removeClass("night")}});navigator.userAgent.match(/(iPad)/)&&(document.ontouchmove=function(){var e;if(s>767&&!$("body").hasClass("demo")){e=Math.ceil($("body").scrollTop()/2.5);$("#header-content").css("-webkit-transform","translateY(-"+e+"px)");return $("#header-inner").css("top","-"+e*.8+"px")}});$(window).on("resize orientationchange",function(){var e;s=$("body").width();e=$(window).scrollTop();return s<=767?$(".navbar").addClass("scrolled"):e>=50&&s>767?$(".navbar").addClass("scrolled"):$(".navbar").removeClass("scrolled")});i=$(".fancybox");$(i).fancybox({padding:5,openEffect:"elastic",openSpeed:150,closeEffect:"elastic",closeSpeed:150,closeClick:!0,helpers:{overlay:{css:{background:"rgba(0, 0, 0, 0.5)"}}}});$("#contact-form").validate({submitHandler:function(e){return $(e).ajaxSubmit({beforeSubmit:t,success:n})},rules:{name:"required",email:{required:!0,email:!0},comments:"required"},errorClass:"error"})}).call(this);