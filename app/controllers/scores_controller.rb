require 'open-uri'
require 'json'

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
      lng: @hike.longitude,
      image_url: helpers.asset_url("hiker.png")
    }]
    get_route
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
    @all_scores = Score.where(user_id: current_user)
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
    minutes = time % 3600 / 60
    seconds = time % 60
    "#{hours}h #{minutes}min #{seconds}sec"
  end

  def get_route
    gpx = Cloudinary::Search
      .expression(@hike.gpx.key)
      .execute
    gpx = gpx.to_h
    url = gpx["resources"][0]["secure_url"]
    file = URI.open(url).read
    doc = Nokogiri::XML(file)
    trackpoints = doc.xpath('//xmlns:trkpt')
    @route = []
    trackpoints.each do |trkpt|
      lat = trkpt.xpath('@lat').to_s.to_f
      lon = trkpt.xpath('@lon').to_s.to_f
      ele = trkpt.text.strip.to_f
      @route << [lon, lat, ele]
    end
  end
end
