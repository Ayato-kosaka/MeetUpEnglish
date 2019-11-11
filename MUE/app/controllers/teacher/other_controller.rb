class Teacher::OtherController < TeacherController
  before_action :current_teacher
  require 'net/https'
  require 'json'

  def newPlace
  end

  def createPlace #外国の対策が未実施
    place = Place.find_or_initialize_by(placeId: params[:placeId])
    if place.new_record?
                                        en_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name&language=en&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      en_json = JSON.parse(en_http)["result"]
      place.en_name = en_json["name"]
                                        ja_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name,website,geometry,formatted_address&language=ja&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      ja_json = JSON.parse(ja_http)["result"]
      place.ja_name = ja_json["name"]
      place.website = ja_json["website"]
      location = ja_json["geometry"]["location"]
      place.latitude = location["lat"]
      place.longitude = location["lng"]
      formatted_address = ja_json["formatted_address"]
      place.save#if文で分けたいところ
    end

    # redirect_to teacher_schedule_index_path if @current_teacher.teacher_places.create(place_id: place.id)
  end
end
