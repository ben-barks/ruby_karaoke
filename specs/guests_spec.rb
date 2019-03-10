require("minitest/autorun")
require('minitest/rg')
require_relative("../bar")
require_relative("../rooms")
require_relative("../guests")
require_relative("../songs")

class GuestsTest < MiniTest::Test

  def setup
    @guest1 = Guests.new('Dan', 100, 'Smoke on the Water')
    @guest2 = Guests.new('Sam', 90, 'No Roots')
    @guest3 = Guests.new('Ellie', 80, "Nothing's Changed")
    @room1 = Rooms.new("1", 2, "Smoke on the Water")
    @room2 = Rooms.new("2", 3, "Nothing's Changed")
    @room3 = Rooms.new("3", 3, "No Roots")
    @bar = Bar.new("Roadhouse", 5000, 1)
    # @song1 = Songs.new()
    # @song2 = Songs.new()
    # @song3 = Songs.new()
  end

  def test_name()
    assert_equal("Dan", @guest1.name)
  end

  def test_wallet()
    assert_equal(100, @guest1.wallet)
  end

  def test_fave_song()
    assert_equal("Smoke on the Water", @guest1.fave_song)
  end

  def test_whoo()
    assert_equal("Whoo!", @guest1.whoo(@guest1, @room1))
  end

  def test_entry_fee_guest()
    assert_equal(90, @guest1.entry_fee_guest)
  end

end
