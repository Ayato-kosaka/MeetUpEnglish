
json.array!(@homes) do |event|
  json.extract! event, :id, :cityId, :date, :start, :end, :peopleNum, :teacherId, :cafeId
  json.start DateTime.parse(event.date.strftime("%Y%m%d")+event.start.strftime("%H%M"))
  json.end DateTime.parse(event.date.strftime("%Y%m%d")+event.end.strftime("%H%M"))
  # json.url home_url(event, format: :html)
end
