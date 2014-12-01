# runner.rb
require 'csv'
require_relative 'album'
require_relative 'track'
require 'pry'

albums = {}

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  album_id = row[:album_id]
  #album_id, id, title, track_num, duration
  track = Track.new(album_id, row[:track_id], row[:title], row[:track_number], row[:duration_ms])

  # if the album hasn't been added to the albums hash yet, add it
  if !albums.has_key?(album_id)
    album = Album.new(album_id, row[:album_name], row[:artists])
    albums[album_id] = album
  else
    album = albums[album_id]
  end

  # add the track to the album's @tracks instance variable
  album.add_track(track)
end

# print out the summary for each album
albums.each do |id, album|
  puts album.summary
end
