
json.array!(@homes) do |event|
  json.extract! event, :id, :city_id, :date, :start, :end, :peopleNum, :teacher_id, :cafe_id
  json.start DateTime.parse(event.date.strftime("%Y%m%d")+event.start.strftime("%H%M"))
  json.end DateTime.parse(event.date.strftime("%Y%m%d")+event.end.strftime("%H%M"))
  # json.url home_url(event, format: :html)
end
