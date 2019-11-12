class Teacher::OtherController < TeacherController
  before_action :current_teacher
  require 'net/https'
  require 'json'

  #teacher_newPlace_other_path 	GET 	/teacher/new_my_place(.:format) 	teacher/other#newPlace
  def newPlace
  end

  #teacher_createPlace_other_path 	POST 	/teacher/create_my_place(.:format) 	teacher/other#createPlace
  def createPlace #外国の対策が未実施
    place = Place.find_or_initialize_by(placeId: params[:placeId])
    #placeId 例 ChIJDTc9GIv7GGAR0wyzbYIBuQ8
    if place.new_record?
                                        en_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name&language=en&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      en_json = JSON.parse(en_http)["result"]
      place.en_name = en_json["name"]
                                        ja_http = Net::HTTP.get(URI.parse("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{placeId}&fields=name,website,geometry,address_component&language=ja&key=AIzaSyBxj9aDYTbBYilvyaYugd9J5zisCodO9kQ"))
      ja_json = JSON.parse(ja_http)["result"]
      place.ja_name = ja_json["name"]
      place.website = ja_json["website"]
      location = ja_json["geometry"]["location"]
      place.latitude = location["lat"]
      place.longitude = location["lng"]
      address = ja_json["address_components"]
      address = address.reverse.map{|n|n["long_name"]}
      if address[1] == "日本"
        prefecture = Prefecture.find_by(name: address[2])
        (3...address.length).each do |num|
          str = address[3..num].join
          break if city = prefecture.cities.find_by(name: str)
        end
        place.city_id = city.id #city_idをつくらないといけない
        unless place.save
          flash.now[:alert] = place.errors
          render :newPlace
        end
      else
        redirect_to teacher_newPlace_other_path
      end
    end
    # redirect_to teacher_schedule_index_path if @current_teacher.teacher_places.create(place_id: place.id)
  end
end
