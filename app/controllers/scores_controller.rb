class ScoresController < ApplicationController
  before_action :set_score, only: %i[show update]
  helper_method :format_duration

  def index
    @scores = Score.where(hike_id: params[:hike_id]).order("duration ASC").limit(10)
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
    @score.hike = @hike
    @score.save
    redirect_to hike_scores_path(@hike)
  end

  def my_scores
    @scores = Score.where(user_id: current_user)
    @scores.group("hike_id")
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def params_score
    params.require(:score).permit(:startDay)
  end

  def format_duration(time)
    hours = time / 3600
    minutes = time % 360 / 60
    seconds = time % 60
    "#{hours}h #{minutes}min #{seconds}sec"
  end
end
