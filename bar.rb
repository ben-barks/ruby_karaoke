require_relative("./guests")
require_relative("./specs/bar_spec")

class Bar
  attr_reader :name, :till, :rooms

  def initialize(name, till, rooms)
    @name = name
    @till = till
    @rooms = rooms
    @guests = ["Dan", "Sam"]
  end

  def guest_count()
    @guests.size
  end

  def new_room(room)
    @rooms = room.name
  end

  def add_guest_to_bar(guest)
    return @guests.push(guest.name)
    entry_fee(guest)
    guest.entry_fee_guest()
  end

  def entry_fee(guest)
    @till += 10
  end

  def guest_to_room(guest)
    @guests.delete(guest.name)
  end

def guest_from_room(guest)
  @guests.push(guest.name)
end

end
