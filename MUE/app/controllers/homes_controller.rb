class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :set_selectedPrefecture, only: [:schedule, :showDetailSchedule]

  skip_before_action :require_Admin, except: [:index, :show, :edit, :new]

  require 'time'

  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
    @home.cityId = params[:selected_city]
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)
    @selectedPrefecture_id =  City.find(@home.cityId).prefectureId

    respond_to do |format|
      if @home.save
        format.html { redirect_to schedule_path(@selectedPrefecture_id), notice: 'Home was successfully created.' }
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
    @selectedPrefecture_id =  City.find(@home.cityId).prefectureId
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to schedule_path(@selectedPrefecture_id), notice: 'Home was successfully updated.' }
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
    @selectedPrefecture_id =  City.find(@home.cityId).prefectureId
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_schedule_path(selected_prefecture: @selectedPrefecture_id), notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home
    @selectedPrefecture_id
  end

  def schecule
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    def set_selectedPrefecture
      @selectedPrefecture = Prefecture.find(params[:id])
      @selectedPrefecture_id = params[:id]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:cityId, :date, :start, :end, :peopleNum, :teacherId, :cafeId)
    end
end
