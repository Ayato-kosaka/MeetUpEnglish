class Teacher::OtherController < TeacherController
  before_action :current_teacher
  require 'net/https'
  require 'json'

  def newPlace
  end

  def createPlace
    latitude = params[:lat]
    longitude = params[:lng]
    placeId = params[:placeId]

    place = Place.find_or_initialize_by(latitude: latitude, longitude: longitude)
    if place.placeId != placeId
      if place.new_record?
        geo_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
        geo_json = JSON.parse(geo_http)["results"][0]["place_id"]
        # placeId = geo_json["place_id"]
        logger.debug("debug#{geo_json}\n")
      end
                                        en_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name,website&language=en&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      en_json = JSON.parse(en_http)["result"]
      en_name = en_json["name"]
                                        ja_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name,website&language=ja&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      ja_json = JSON.parse(ja_http)["result"]
      ja_name = ja_json["name"]
      website = ja_json["website"]

      logger.debug({placeId: placeId, en_name: en_name, ja_name: ja_name,website: website,latitude: latitude, longitude: longitude})
      # place.update_attributes(placeId: placeId, en_name: en_name, ja_name: ja_name,website: website)
    end

    # redirect_to teacher_schedule_index_path if @current_teacher.teacher_places.create(place_id: place.id)
  end

  def jaPlaceName
    @english_place_name = params[:english_place_name]
  end
end
