class HikesController < ApplicationController
  before_action :set_hike, only: %i[show edit update destination destroy]
  helper_method :get_markers, :average

  def index
    @hikes = Hike.where(approved: true)
    if params[:query].present?
      @hikes = @hikes.where('name ILIKE ?', "%#{params[:query]}%")
      # binding.pry
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/card_hike', locals: { hikes: @hikes }, formats: [:html] }
    end
  end

  def show
    @markers = [
      {
        lat: @hike.latitude,
        lng: @hike.longitude,
        image_url: helpers.asset_url("hiker.png")
      }
    ]
  end

  def edit
  end

  def update
    @hike.update(params_hike)
    redirect_to hikes_admin_path
  end

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new(params_hike)
    # @hike.user_id = current_user.id
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
        lng: hike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { hike: hike })
        image_url: helpers.asset_url("hiker.png")
      }
    end
  end

  def destination
    @marker = [{
      lat: @hike.latitude,
      lng: @hike.longitude,
      image_url: helpers.asset_url("hiker.png")
    }]
  end

  def destroy
    @hike.destroy
    redirect_to root_path
  end

  def admin
    @hikes = Hike.where(approved: false)
  end

  private

  def set_hike
    @hike = Hike.find(params[:id])
  end

  def params_hike
    params.require(:hike).permit(:name, :description, :photo, :latitude, :longitude, :address, :gpx, :approved)
  end

  def get_markers(hike)
    hike = Hike.find(hike.id)
    @markers = [
      {
        lat: hike.latitude,
        lng: hike.longitude,
        image_url: helpers.asset_url("hiker.png")
      }
    ]
  end

  def average(hike)
    reviews = hike.reviews
    total = 0
    if reviews != []
      reviews.each do |review|
        total += review.difficulty
      end
      total / reviews.size
    end
  end
end
