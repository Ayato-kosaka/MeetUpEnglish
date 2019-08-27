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
$("#display_show").parent().children("a").addClass("active");//のちに消す
$(".region_a").click(function(){
  var region_childern_ul = $(this).parent().children("ul")
  if($(this).hasClass("active")){
    region_childern_ul.hide();
    $(this).removeClass("active");
  } else{
    region_childern_ul.show();
    $(this).addClass("active");
  }
 });

 $(".pagetop").click(function () {
  $('body,html').animate({
        scrollTop: 0
    }, 500);
    return false;
 });
})

var swi = 0;
$(window).scroll(function() { //サイドボックスの固定 1=>固定状態 0=>固定されていない

  if((swi == 0)&&($(this).scrollTop()>153)&&($(this).scrollTop()<($("body").height()-$("#footer1").height()-$("#sidebox2").height()))){
    swi = 1;
    $("#sidebox2").css("position","fixed");
    $("#sidebox2").css("top",33);
  }

  if((swi == 1)&&($(this).scrollTop()<=153)){
    swi = 0;
    $("#sidebox2").css("position","static");
  }

  if((swi == 1)&&($(this).scrollTop()>=($("body").height()-$("#footer1").height()-$("#sidebox2").height()))) {
    swi = 0;
    $("#sidebox2").css("position","absolute");
    $("#sidebox2").css("top",$("body").height()-$("#footer1").height()-$("#sidebox2").height()-24);
  }

})

jQuery(function($) {//articleのどこをタッチしても飛ぶ

  //data-hrefの属性を持つtrを選択しclassにclickableを付加
  $('article[data-href]').addClass('clickable')

    //クリックイベント
    .click(function(e) {

      //e.targetはクリックした要素自体、それがa要素以外であれば
      if(!$(e.target).is('a')){

        //その要素の先祖要素で一番近いtrの
        //data-href属性の値に書かれているURLに遷移する
        window.location = $(e.target).closest('article').data('href');}
  });

  $('div[data-href]').addClass('clickable')

    //クリックイベント
    .click(function(e) {

      //e.targetはクリックした要素自体、それがa要素以外であれば
      if(!$(e.target).is('a')){

        //その要素の先祖要素で一番近いtrの
        //data-href属性の値に書かれているURLに遷移する
        window.location = $(e.target).closest('div').data('href');}
  });
});
