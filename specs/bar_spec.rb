require("minitest/autorun")
require('minitest/rg')
require_relative("../bar")
require_relative("../rooms")
require_relative("../guests")
require_relative("../songs")

class BarTest < MiniTest::Test

  def setup
    @room1 = Rooms.new("1", 2, "Smoke on the Water")
    @room2 = Rooms.new("2", 3, "Nothing's Changed")
    @room3 = Rooms.new("3", 3, "No Roots")
    @guest1 = Guests.new('Dan', 100, 'Smoke on the Water')
    @guest2 = Guests.new('Sam', 90, 'No Roots')
    @guest3 = Guests.new('Ellie', 80, "Nothing's Changed")
    @bar = Bar.new("Roadhouse", 5000, @room1)
  end

  def test_bar_name()
    assert_equal("Roadhouse", @bar.name)
  end

  def test_bar_till()
    assert_equal(5000, @bar.till)
  end

  def test_bar_guests()
    assert_equal(2, @bar.guest_count)
  end

  def test_add_guest_to_bar()
    assert_equal(["Dan", "Sam", "Ellie"], @bar.add_guest_to_bar(@guest3))
  end

  def test_new_room()
    @bar.new_room(@room2)
    assert_equal("2", @bar.rooms)
  end

  def test_rooms()
    assert_equal(@room1, @bar.rooms)
  end

  def test_entry_fee()
    @bar.add_guest_to_bar(@guest3)
    assert_equal(5010, @bar.entry_fee(@guest3))
  end

  def test_guest_to_room()
    @bar.guest_to_room(@guest1)
    assert_equal(1, @bar.guest_count)
  end

  def test_guest_from_room()
    @bar.guest_to_room(@guest1)
    @bar.guest_from_room(@guest1)
    assert_equal(2, @bar.guest_count)
  end
end
