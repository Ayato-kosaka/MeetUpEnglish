# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#index
$(document).on 'turbolinks:load', ->
  $('#future_events').click ->
    $(@).toggleClass('active')
    unless $('#future_events_ul').hasClass('ajax')
      $.ajax
        type: "get",
        url: "/teacher/schedule.js?role=future",
      .done (data) ->
        $('#future_events_ul')
          .addClass ('ajax')
        $('#future_events_ul')
          .hide()
          .slideDown(300);
  $('#finished_events').click ->
    $(@).toggleClass('active')
    unless $('#finished_events_ul').hasClass('ajax')
      $.ajax
        type: "get",
        url: "/teacher/schedule.js?role=finished",
      .done (data) ->
        $('#finished_events_ul')
          .addClass ('ajax')
        $('#finished_events_ul')
          .hide()
          .slideDown(300);








#calendar
###
初期画面は月表記で、dateのみのjsonを参照する
週ボタンを押したら、詳細まであるjsonを参照するようにeventを変更し
月ボタンを押したら、dateのみのjsonを参照する
###
$(document).on 'turbolinks:load', ->

  lowerThanDateOnly = (date1, date2) ->
    year1 = date1.getFullYear()
    month1 = date1.getMonth() + 1
    day1 = date1.getDate()
    year2 = date2.getFullYear()
    month2= date2.getMonth() + 1
    day2 = date2.getDate()
    if year1 == year2
      if month1 == month2
        return day1 < day2
      else
        return month1 < month2
    else
      return year1 < year2


  $('#calendar-ts').fullCalendar {
    # dayClick: (date, allDay, jsEvent, view) ->
    #   $("#calendar-ts").fullCalendar("clientEvents",  (e) -> #This method will return an array of Event Objects that FullCalendar has stored in client-side memory.
    #     if moment(date).format("YYYY-MM-DD") == moment(e.start).format("YYYY-MM-DD")
    #         alert(e.id)
    #   )
    # ,

    eventRender: (event,element) ->
      if !event.url
        $('.fc-day-top[data-date=' + String(moment(event.start).format("YYYY-MM-DD")) + ']').addClass('event_plan')
        element.hide();
    ,
    events: '/teacher/schedule.json',
    dayClick: (date, jsEvent, view) ->
      if lowerThanDateOnly(date._d, moment()._d)
        # show_shecule_path if date has event
      else
        window.location.href = '/teacher/schedule/new?date=' +  String(moment(date).format("YYYY-MM-DD"));
    ,
    # カレンダー上部を年月で表示させる
    titleFormat: 'YYYY/M' ,
    # 曜日を日本語表示
    dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    header: {
      left: 'month,agendaWeek',
      center: 'title',
      right: 'prev today next'
    },
    buttonText: {
      prevYear: '前年',
      nextYear: '翌年',
      today: 'today',
      month: '月',
      week: '週',
      day: '日'
    },
    # height: 960, //高さをピクセルで指定
  	# defaultView: 'agendaDay', //初めの表示内容を指定　内容はこちらを参照→ http://fullcalendar.io/docs/views/Available_Views/
  	# aditable: true, //trueでスケジュールを編集可能にする
  	# allDaySlot: false,　//falseでagendaDay表示のときに全日の予定欄を非表示にする
    #
  	# //時間の表示フォーマットを指定する　指定方法はこちらを参照→http://momentjs.com/docs/#/displaying/format/
  	# timeFormat: {
  	# 	agenda: 'h(:mm)'
  	# },
  	# slotEventOverlap: false, //スケジュールが重なったとき、重ねて表示するかどうか（falseにすると、重ねずに表示する）
  	# axisFormat: 'H:mm', //時間軸に表示する時間の表示フォーマットを指定する(ヒョジ方法はtimeFormatと同じ)
  	# slotDuration: '01:00:00', //表示する時間軸の細かさ
  	# snapDuration: '01:00:00', //スケジュールをスナップするときの動かせる細かさ
  	# minTime: "00:00:00", //スケジュールの開始時間
  	# maxTime: "24:00:00", //スケジュールの最終時間
  	# defaultTimedEventDuration: '01:00:00', //画面上に表示する初めの時間(スクロールされている場所)
  	# eventClick: function(event) { //イベントをクリックしたときに実行
    #
  	# },
  	# dayClick: function(date){ //イベントじゃないところをクリックしたとき(日をクリックしたとき)に実行
    #
  	# },
  	# droppable: true, //外部要素からのドラッグアンドドロップを可にする
  	# drop: function(date){ //外部要素からドラッグアンドドロップしたときに実行
    #
  	# },
  	# eventDragStop: { //カレンダー上にドラッグし終わったときに実行
    #
  	# }
    # 縦横比
    # aspectRatio: 1.8,
  	# //カレンダーを再描画
  	# $('#calendar').fullCalendar('rendar');
    #
  	# //カレンダーを削除
  	# $('#calendar').fullCalendar('destroy');
    #
  	# //イベントを追加
  	# $('#calendar').fullCalendar('renderEvent', event, true); //eventはeventオブジェクト
    #
  	# //イベントを更新
  	# $('#calendar').fullCalendar('updateEvent', event);

  }
  $('.fc-agendaWeek-button').click ->
    $('#calendar-ts').fullCalendar( 'removeEvents' );
    $('#calendar-ts').fullCalendar( 'addEventSource',[{titele:"test2",start:"2019-10-20T08:30:00",end:"2019-10-20T09:01:00",url: "http://localhost:3000/teacher/account"}] );
    $('#calendar-ts').fullCalendar( 'rerenderEvents' );

  $('.fc-month-button').click ->
    $('#calendar-ts').fullCalendar( 'removeEvents' );
    $('#calendar-ts').fullCalendar( 'addEventSource','/teacher/schedule.json' );
    $('#calendar-ts').fullCalendar( 'rerenderEvents' );
  return


$(document).on 'turbolinks:before-cache', ->
  $('#calendar-ts').empty()
  return




# dayClick: function(date, jsEvent, view) {…処理…} 日付クリックイベント
# eventClick: function(calEvent, jsEvent, view) {…処理…}
