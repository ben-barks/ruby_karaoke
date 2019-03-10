require_relative("./bar")


class Guests
  attr_reader :name, :wallet, :fave_song

  def initialize(name, wallet, fave_song)
    @name = name
    @wallet = wallet
    @fave_song = fave_song
  end

  def whoo(guest, room)
    p "Whoo!" if guest.fave_song == room.current_song
  end

  def entry_fee_guest()
    return @wallet -= 10
  end
end
