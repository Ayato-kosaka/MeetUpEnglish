class HomesController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  layout 'about_layout.html.erb'

  skip_before_action :require_Admin, except: [:index, :show, :edit, :new]

  protect_from_forgery

  require 'time'

  # GET /homes
  # GET /homes.json
  def index
    @homes = Event.all
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Event.new
    @home.city_id = params[:selected_city]
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Event.new(event_params)
    @selectedPrefecture_id =  City.find(@home.city_id).prefecture_id

    respond_to do |format|
      if @home.save
        format.html { redirect_to schedule_path(@selectedPrefecture_id), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    @selectedPrefecture_id =  City.find(@home.city_id).prefecture_id
    respond_to do |format|
      if @home.update(event_params)
        format.html { redirect_to schedule_path(@selectedPrefecture_id), notice: 'Event. was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @selectedPrefecture_id =  City.find(@home.city_id).prefecture_id
    @home.contacts.each{|n|n.update(home_id: nil)}
    @home.destroy
    respond_to do |format|
      format.html { redirect_to schedule_path(@selectedPrefecture_id), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home
    @cities = City.where(id: Event.pluck(:city_id).uniq)
    @prefectures = Prefecture.where(cities: @cities)
    # @prefectures = [[1, "東京都"], [2, "神奈川県"], [3, "千葉県"]]
    # @cities = [[1, "町田", 1], [2, "相模原", 2], [3, "八王子", 1], [4, "橋本", 2], [5, "横浜", 2], [7, "新宿", 1], [8, "渋谷", 1], [9, "吉祥寺", 1], [10, "銀座", 1], [11, "池袋", 1], [12, "調布", 1], [13, "市川", 3], [14, "浦安", 3], [15, "千駄木", 1]]
  end

  def schedule
    @city = City.find(params[:id])
    @events = @city.where(["date > ?",  Date.current])
    # @events = Event.where(["city_id = ? and date > ?",  1, Date.current])
    @dates = @events.pluck(:date).uniq
    @teachers = Teacher.where(id: @events.pluck(:teacher_id).uniq)
    @caves = Cafe.where(id: @events.pluck(:city_id).uniq)
    # @caves = City.find(1).caves
    @title = params[:id]==1 ? "武相庵での英会話開催" : @city.name+'での英会話開催スケジュール'
    @description = params[:id]==1 ?
      "町田市の駅近カフェ、武相庵で最大１：３で１時間１０００円で開催しています。気軽におしゃれなカフェで英会話をしませんか？授業形態は、全てフリーカンバセーションとなっています。初心者から上級者まで対応可能ですので、お気軽に参加ください。"
      : "#{@city.name}の駅近カフェ、#{@caves.map{|m|m.name}.join("、")}で、マンツーマン１時間１７００円で開催しています。気軽におしゃれなカフェで英会話をしませんか？授業形態は、全てフリーカンバセーションとなっています。初心者から上級者まで対応可能ですので、お気軽に参加ください。"
  end

  def overview
    redirect_to about_path
  end

  def top
    render layout: false #application.html.erbを適用したくない
  end

  def about
    render layout: 'about_layout.html.erb'
  end

  def questionnaire
    render layout: 'about_layout.html.erb'
  end
  def questionnaire_create
    message = "　英会話にご満足いただけましたか？→#{['満足','やや満足','普通','やや不満','不満'][params['one'].to_i-1]}\n　担当の先生にご満足いただけましたか？→#{['満足','やや満足','普通','やや不満','不満'][params['two'].to_i-1]}
      　英会話を習ったことはありますか？→#{['習っていた','習っている','習っていない'][params['three'].to_i-1]}\n　一番都合のいい時間帯を教えてください。→#{['午前中','12時～15時','16時～20時'][params['for'].to_i-1]}
      　人数設定はいかがでしたでしょうか。→#{['丁度良い','多く感じた','少なく感じた'][params['five'].to_i-1]}\n　お写真はブログ等で使用させていただいてもよろしいですか？→#{['はい','顔を出さないなら','いいえ'][params['six'].to_i-1]}"
    Contact.create(title: "アンケート with " + Teacher.find(params[:id]).name, name: (Contact.last.id+1).to_s, message: message, email: "")
    redirect_to top_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @home = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:city_id, :date, :start, :end, :peopleNum, :teacher_id, :cafe_id)
    end
end
