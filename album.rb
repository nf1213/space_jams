class Album
  attr_reader :id, :title, :artists, :tracks, :summary
  def initialize(id, title, artists)
    #string
    @id = id
    @title = title
    @artists = artists
    #[track]
    @tracks = []
    @duration_ms = 0
    @summary = summary
  end

  def duration_min
    min = @duration_ms / 60000.0
    min.round(2)
  end

  def summary
    "\nName: #{@title}\nArtist(s): #{@artists}\nDuration (min.): #{duration_min}\nTracks: #{print_tracks}"
  end

  def print_tracks
    string = ""
    @tracks.each do |track|
      string += "\n\t-" + track.title
    end
    string
  end

  def add_track(track)
    @tracks << track
    @duration_ms += track.duration.to_i
  end

  def to_s
    summary
  end
end
