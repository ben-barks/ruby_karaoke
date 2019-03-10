class Songs
  attr_reader :name, :room

  def initialize(name, room)
    @name = name
    @room = room
    @all_songs = []
  end

  def current_song(room)
    return @name if room == @room
  end

  def add_song_to_room(song, room)
    @name = song
    @room = room
  end

  def add_song_to_playlist(song)
    @all_songs.push(song.name)
  end

  def check_playlist()
    return @all_songs
  end

end
