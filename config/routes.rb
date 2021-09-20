Rails.application.routes.draw do
  get "/index" => "tracks#index"
  get "/100" => "tracks#top100"
end
