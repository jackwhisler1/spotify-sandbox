Rails.application.routes.draw do
  namespace :api do
    get "/spotify_authorize" => "spotify#spotify_authorize"
    get "/spotify/callback" => "spotify#spotify_callback"
    

    get "/index" => "tracks#index"
    get "/songs/100" => "tracks#top100"
  end
end
