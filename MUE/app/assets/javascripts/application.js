// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
$(function(){//prefectureを選ぶ画面のポチポチ + acgtive
$(".region_a").parent().children("ul").hide();
$("#display_show").show();//のちに消す
$("#display_show").parent().children("a").addClass("active");//のちに消す
$(".region_a").click(function(){
  var region_childern_ul = $(this).parent().children("ul")
  if(region_childern_ul.is(':hidden')){
    region_childern_ul.show();
    $(this).addClass("active");
  } else{
    region_childern_ul.hide();
    $(this).removeClass("active");
  }
 });
})

$(function(){
  var str = $('textarea').val();
$('#text').html(str.replace(/\r?\n/g, '<br>'));
})

var swi = 0;
$(window).scroll(function() { //サイドボックスの固定

  if((swi == 0)&&($(this).scrollTop()>153)){
    swi = 1;
    $("#sidebox").css("position","fixed");
    $("#sidebox").css("top",33);
  }

  if((swi == 1)&&($(this).scrollTop()<=153)){
    swi = 0;
    $("#sidebox").css("position","static");
  }

})
