require("minitest/autorun")
require('minitest/rg')
require_relative("../bar")
require_relative("../rooms")
require_relative("../guests")
require_relative("../songs")

class SongsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Smoke on the Water", 1)
    @song2 = Songs.new("No Roots", 2)
    @song3 = Songs.new("Nothing's Changed", 3)
    @room1 = Rooms.new("1", 2, "Smoke on the Water")
    @room2 = Rooms.new("2", 3, "Nothing's Changed")
    @room3 = Rooms.new("3", 3, "No Roots")
  end

  def test_name()
    assert_equal("Smoke on the Water", @song1.name)
  end

  def test_room()
    assert_equal(1, @song1.room)
  end

  def test_current_song()
    assert_equal("Smoke on the Water", @song1.current_song(1))
  end

  def test_song_to_room()
    @song1.add_song_to_room(@song2.name, @room1)
    assert_equal("No Roots", @song1.current_song(@room1))
  end

  def test_add_song_to_playlist()
    @song1.add_song_to_playlist(@song1)
    assert_equal(["Smoke on the Water"], @song1.check_playlist)
  end

  def test_check_playlist()
    assert_equal([], @song1.check_playlist)
  end
end
