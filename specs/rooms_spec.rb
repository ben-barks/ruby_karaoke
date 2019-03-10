require("minitest/autorun")
require('minitest/rg')
require_relative("../bar")
require_relative("../rooms")
require_relative("../guests")
require_relative("../songs")

class RoomsTest < MiniTest::Test

  def setup()
    @room1 = Rooms.new("1", 2, "Smoke on the Water")
    @room2 = Rooms.new("2", 3, "Nothing's Changed")
    @room3 = Rooms.new("3", 3, "No Roots")
    @guest1 = Guests.new('Dan', 100, 'Smoke on the Water')
    @guest2 = Guests.new('Sam', 90, 'No Roots')
    @guest3 = Guests.new('Ellie', 80, "Nothing's Changed")
    @bar = Bar.new("Roadhouse", 5000, 1)
  end

  def test_name()
    assert_equal("1", @room1.name)
  end

  def test_limit()
    assert_equal(2, @room1.limit)
  end

  def test_guest_count()
    assert_equal(0, @room1.guest_count)
  end

  def test_current_song()
    assert_equal("Smoke on the Water", @room1.current_song)
  end

  def test_guest_from_bar()
    @room1.guest_from_bar(@guest1)
    assert_equal(1, @room1.guest_count)
  end

  def test_guest_from_bar__full()
    @room1.guest_from_bar(@guest1)
    @room1.guest_from_bar(@guest2)
    assert_equal("Try the next room, sunshine", @room1.guest_from_bar(@guest3))
  end

  def test_guest_from_room()
    @room1.guest_from_bar(@guest1)
    @room1.guest_from_room(@guest1)
    assert_equal(0, @room1.guest_count)
  end

  def test_check_in_to_room()
    @room1.check_in_to_room(@guest1, @room1, @bar)
    assert_equal(1, @room1.guest_count)
    assert_equal("Whoo!", @guest1.whoo(@guest1, @room1))
    assert_equal(1, @bar.guest_count)
  end

  def test_check_out_of_room()
    @room1.check_in_to_room(@guest1, @room1, @bar)
    @room1.check_out_of_room(@guest1, @room1, @bar)
    assert_equal(0, @room1.guest_count)
    assert_equal(2, @bar.guest_count)
  end

end
