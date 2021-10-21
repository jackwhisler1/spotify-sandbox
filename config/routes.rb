Rails.application.routes.draw do
  namespace :api do
    get "/spotify_authorize" => "spotify#spotify_authorize"
    get "/spotify/callback" => "spotify#spotify_callback"
    get "/spotify/top_songs" => "spotify#top_songs"
    get "/spotify/song_ids" => "spotify#song_ids"
  end
  
  get "/index" => "tracks#index"
  
end
