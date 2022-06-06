class ReviewsController < ApplicationController
  before_action :set_hike, only: %i[show edit update]

  def index
    @reviews = Review.where(params[:hike_id] = :hike_id)
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.hike = params[:hike_id]
    if @review.save
      redirect_to hike_reviews_path(params[:hike_id])
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :difficulty)
  end
end
