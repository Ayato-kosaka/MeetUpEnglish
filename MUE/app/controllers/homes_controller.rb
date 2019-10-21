class HomesController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_selectedPrefecture, only: [:schedule]

  skip_before_action :require_Admin, except: [:index, :show, :edit, :new]

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
    @selectedPrefecture_id
  end

  def schedule
  end

  def top
    render layout: false #application.html.erbを適用したくない
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @home = Event.find(params[:id])
    end

    def set_selectedPrefecture
      @selectedPrefecture = Prefecture.find(params[:id])
      @selectedPrefecture_id = params[:id]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:city_id, :date, :start, :end, :peopleNum, :teacher_id, :cafe_id)
    end
end
