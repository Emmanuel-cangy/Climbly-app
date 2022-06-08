class HikesController < ApplicationController
  before_action :set_hike, only: %i[show edit update create destination]

  def index
    @hikes = Hike.all
  end

  def show

  end

  def edit
  end

  def update
  end

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new(params_hike)
    @hike.user = current_user
    if @hike.save
      redirect_to root_path
    else
      render :new
    end
  end

  def map
    @hikes = Hike.all

    @markers = @hikes.geocoded.map do |hike|
      {
        lat: hike.latitude,
        lng: hike.longitude
      }
    end
  end

  def destination
    @marker = [{
      lat: @hike.latitude,
      lng: @hike.longitude
    }]
  end

  private

  def set_hike
    @hike = Hike.find(params[:id])
  end

  def params_hike
    params.require(:hike).permit(:name)
  end
end
