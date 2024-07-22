require 'json'
require 'time'
require 'dotenv'
Dotenv.load

# controller for asteroids gallery
class AsteroidsController < ApplicationController
  def index
    start_date = (Time.now - 6.days).strftime('%Y-%m-%d')
    end_date = Time.now.strftime('%Y-%m-%d')
    api_key = ENV['API_KEY']

    @response = RestClient.get "https://api.nasa.gov/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{api_key}",
                               { content_type: :json, accept: :json }

    render json: @response
  end
end
