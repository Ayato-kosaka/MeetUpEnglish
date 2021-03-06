
  json.array!(@schedule.where(finished: false)) do |event|
    json.extract! event, :id, :start, :end
    json.start DateTime.parse(event.date.strftime("%Y%m%d")+event.start.strftime("%H%M"))
    json.end DateTime.parse(event.date.strftime("%Y%m%d")+event.end.strftime("%H%M"))
    # json.url home_url(event, format: :html)
  end
