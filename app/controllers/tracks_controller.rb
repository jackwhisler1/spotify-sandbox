class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks
  end
  def top100
    s_tracks = 
  RSpotify::Playlist.find("jnwhisler","6mBpZO4SbII3NmV6TtqwR3").tracks
    @tracks = s_tracks.map do |s_track|
      Track.new_from_spotify_track(s_track)
    end
    render json: @tracks
  end
end
