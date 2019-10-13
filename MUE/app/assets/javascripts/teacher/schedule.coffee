# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#calendar').fullCalendar {
    # カレンダー上部を年月で表示させる
    titleFormat: 'YYYY年 M月',
    # 曜日を日本語表示
    dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    header: {
      left: '',
      center: 'title',
      right: 'today prev,next'
    },
    buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
    # イベントの時間表示を２４時間に
    timeFormat: "HH:mm",
    # イベントの色を変える
    eventColor: '#63ceef',
    # イベントの文字色を変える
    eventTextColor: '#000000',
  }
  return
$(document).on 'turbolinks:before-cache', ->
  $('#calendar').empty()
  return




# dayClick: function(date, jsEvent, view) {…処理…} 日付クリックイベント
# eventClick: function(calEvent, jsEvent, view) {…処理…}
