class ScoresController < ApplicationController
  before_action :set_score, only: %i[show update]

  def index
    @scores = Score.all
  end

  def show
  end

  def new
    @score = Score.new
    @hike = Hike.find(params[:hike_id])
    @marker = [{
      lat: @hike.latitude,
      lng: @hike.longitude
    }]
  end

  def create
    @hike = Hike.find(params[:hike_id])
    end_date = Time.now
    @score = Score.new(params_score)
    sec = (@score.startDay.to_f / 1000).to_s
    @score.duration = end_date - Time.strptime(sec, '%s')
    @score.user = current_user
    @score.save
    puts @score.duration
    redirect_to hike_scores_path(@hike)
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def params_score
    params.require(:score).permit(:startDay)
  end

end
