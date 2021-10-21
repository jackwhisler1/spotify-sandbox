class Api::SpotifyController < ApplicationController
  
  def spotify_authorize
    redirect_to "https://accounts.spotify.com/authorize?client_id=#{Rails.application.credentials.spotify_api_key[:client_id]}&response_type=code&redirect_uri=http://localhost:3000/api/spotify/callback"
  end

  def spotify_callback
    code = params[:code]
    response = HTTP.post("https://accounts.spotify.com/api/token", 
    form: {
      grant_type: "authorization_code",
      code: code,
      redirect_uri: "http://localhost:3000/api/spotify/callback",
      client_id: Rails.application.credentials.spotify_api_key[:client_id],
      client_secret: Rails.application.credentials.spotify_api_key[:client_secret]
    })

    @access_token = response.parse["access_token"]
    response = HTTP.auth("Bearer #{@access_token}").get("https://api.spotify.com/v1/me")
    render json: response.parse
  end

  def top_songs()
    response = HTTP.auth("Bearer BQBQZXdIZ7l-58FvthLAOTxpZ1EMnv8pA4n2MQtVey54y9N767nb60540-orfjwsybM9EOSzndanDJgEHkG51IR_exWMvyBdK842XnJDX6ENZZ2oPxnkZc4foKzewwWOVoVZJNVw-bFaj_vOFKZrKw").get("https://api.spotify.com/v1/me/top/tracks?time_range=medium_term&limit=200&offset=1")
    response = response.parse
    songs = []
    response["items"].each do |song|
      songs << {
       "title": song["name"],
       "artist": song["artists"][0]["name"]
      }
    end
    render json: songs
  end

  def song_ids()
    response = HTTP.auth("Bearer BQCBV_dJT9PS28jSVq0Woppd7ypYfuIx4Fdqw527AIBlakS9AgDTmM9EGZWm2ePbgB-XKjbokwpvkHjOiTxYdwaq75J8B-FL79svNMHaYL7RLfyFavy8hhhQpBnhyVkcqJ27zbItNo85dUbXzztepw").get("https://api.spotify.com/v1/me/top/tracks?time_range=medium_term&limit=200&offset=1")
    response = response.parse
    ids = ""
    response["items"].each do |song|
      ids += song["id"] + ","
    end
    render json: ids
  end

end
