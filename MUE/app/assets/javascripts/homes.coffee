# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


###     example
$(document).on 'turbolinks:load', ->
  $('p').css('color', 'red')
###

$(document).on 'turbolinks:load', ->

# aplication script
  $(".pagetop").click -> #If you click pagetop_btn go pagetop
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;



#homes/about
  $(".more").hide()
  $("#about .grad-btn").click ->
    $(@).prev(".more").show()
    $(@).hide()


  $('.slider').slick({
      autoplay:true,
      autoplaySpeed:5000,
      dots:true,
    })


#contact
  $(".modal-close-btn").click ->
    $("#overlay").hide()

#schedule
  $(".toggle_active").click ->
    $(@).toggleClass('active')
  $("#schedule .toggle_active").click ->
    $(@).parent().prev(".teacher_img").toggleClass('active')
