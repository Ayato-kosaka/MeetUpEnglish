class Users::SearchController < UsersController
  before_action :at_search

  #search_path 	GET 	/search(.:format) 	users/search#index
  def index
    if session[:prefecture].nil?
      redirect_to search_prefecture_path
    end
  end

  #search_prefecture_path 	GET 	/search/prefecture(.:format) 	users/search#prefecture
  def prefecture
    @prefectures = [["北海道", 1], ["東北", 2], ["関東", 3], ["中部", 4], ["近畿", 5], ["中国", 6], ["四国", 7], ["九州・沖縄", 8]]
  end

  #search_city_path 	GET 	/search/city(.:format) 	users/search#city
  def city
  end


  private
    def at_search
      @at = "search"
    end
end
