class SpotifyController < ApplicationController
  def index
    
    render json: { message: "online" }
  end
end
