class Track
  attr_reader :album_id, :id, :title, :track_num, :duration
  def initialize(album_id, id, title, track_num, duration)
    @album_id = album_id
    @id = id
    @title = title
    @track_num = track_num
    @duration = duration
  end
end
