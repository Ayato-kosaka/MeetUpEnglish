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


# homes#home script
  $(".region_a").click -> #prefectureを選ぶ画面のポチポチ + acgtive
    region_childern_ul = $(@).parent().children("ul")
    if $(@).hasClass("active")
      region_childern_ul.hide()
      $(@).removeClass("active")
    else
      region_childern_ul.show()
      $(@).addClass("active")

  $("#display_show").parent().children("a").addClass "active" #のちに消す

#homes/about
  $(".more").hide()
  $("#about .grad-btn").click ->
    $(@).prev(".more").show()
    $(@).hide()
