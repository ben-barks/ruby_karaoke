class Rooms
  attr_reader :name, :limit, :current_song

  def initialize(name, limit, current_song)
    @name = name
    @limit = limit
    @current_song = current_song
    @current_guests_in_room = []
  end

  def guest_count()
    @current_guests_in_room.size
  end

  def guest_from_bar(guest)
    if guest_count() < @limit
      @current_guests_in_room << guest
    else p "Try the next room, sunshine"
    end
  end

  def check_in_to_room(guest, room, bar)
    bar.guest_to_room(guest)
    room.guest_from_bar(guest)
    guest.whoo(guest, room)
  end

  def guest_from_room(guest)
    @current_guests_in_room.delete(guest)
  end

  def check_out_of_room(guest, room, bar)
    bar.guest_from_room(guest)
    room.guest_from_room(guest)
  end

  end
