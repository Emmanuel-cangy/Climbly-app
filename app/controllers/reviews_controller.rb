class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update]

  def index
    @hike = Hike.find(params[:hike_id])
    @reviews = Review.where(hike_id: params[:hike_id])
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to hike_reviews_path(@review.hike_id)
  end

  def new
    @hike = Hike.find(params[:hike_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @hike = Hike.find(params[:hike_id])
    @review.user = current_user

    @review.hike = @hike
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
    params.require(:review).permit(:content, :rating, :difficulty, photos: [])
  end
end
