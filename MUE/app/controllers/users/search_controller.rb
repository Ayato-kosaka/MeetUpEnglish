class Users::SearchController < UsersController
  before_action :at_search

  #search_path 	GET 	/search(.:format) 	users/search#index
  def index
    unless params[:city] || params[:station]
      redirect_to search_prefecture_path
    end
     @events = Event.where(place: City.find(params[:city]).places) if params[:city]
     if params[:station]
       station = Station.find(params[:station])
       @events = Event.where(place: Place.within_box(2, station.latitude, station.longitude))
     end
  end

  #search_prefecture_path 	GET 	/search/prefecture(.:format) 	users/search#prefecture
  def prefecture
    @regions = [["北海道", 1], ["東北", 2], ["関東", 3], ["中部", 4], ["近畿", 5], ["中国", 6], ["四国", 7], ["九州・沖縄", 8]]
  end

  #search_city_path 	GET 	/search/city(.:format) 	users/search#city
  def city
    session[:prefecture] = params[:id]
    @prefecture = Prefecture.find(params[:id])
    @cities = @prefecture.cities.order(:kana)
    @flag_double
  end

  #search_station_path 	GET 	/search/station(.:format) 	users/search#station
  def station
    session[:prefecture] = params[:id]
    @lines = Prefecture.find(params[:id]).lines.all
  end

  private
    def at_search
      @at = "search"
    end
end
