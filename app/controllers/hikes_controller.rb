class HikesController < ApplicationController
  before_action :set_score, only: %i[show edit update create]

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
    @hike = hike.new(params_hike)
    @hike.user = current_user
    if @hike.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_hikes
    @score = Score.find(params[:id])
  end

  def params_hike
    params.require(:hike).permit(:name)
  end
end
