s_tracks = 
RSpotify::Playlist.find("jnwhisler","6mBpZO4SbII3NmV6TtqwR3").tracks
@tracks = s_tracks.map do |s_track|
  track = Track.new_from_spotify_track(s_track)
  track.save
end
