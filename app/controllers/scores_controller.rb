class ScoresController < ApplicationController
  before_action :set_score, only: %i[show update]

  def index
    @scores = Score.all
  end

  def show
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(params_score)
    @score.user = current_user
    if @score.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def params_score
    params.require(:score).permit(:startDay, :endDay, :duration)
  end
end
