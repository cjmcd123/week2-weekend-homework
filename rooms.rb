require("pry")
class Room

  attr_reader :name, :size, :cost
  attr_accessor :songs, :guests, :till

  def initialize(name, size, cost, songs)
    @name = name
    @size = size
    @cost = cost
    @songs = songs
    @guests = []
  end

  def song_count()
    return @songs.length()
  end

  def guest_count()
    return @guests.length()
  end

  def add_song(title, artist)
    @songs << Song.new(title, artist)
  end

  def add_guest(name, money, fav_song, room_cost)
    result = check_size()
    if result == false
      return "Room at capacity"
    else
      # new_money += room_cost
      # @guests << Guest.new(name, new_money, fav_song)
      # left over code from when the room was tested indipendently from bar
      @guests << Guest.new(name, money, fav_song)
      guest = find_guest(name)
      guest.guest_pays(room_cost)
    end
  end

  def remove_guest(name)
    result = find_guest(name)
    @guests.delete(result)
  end

  def find_guest(name)
    for guest in @guests
      if guest.name == name
        return guest
      end
    end
  end

  def check_size()
    count = guest_count()
    if count < @size
      return true
    else
      return false
    end
  end

  def fav_song_roar(guest)
    fav_song = guest_fav_song(guest)
    for song in @songs
      if song.name == fav_song
        return "Whoo!"
      else
        return "Sorry"
      end
    end
  end

  def guest_fav_song(name)
    guest = find_guest(name)
    return guest.fav_song
  end

  def guest_buys_food(cost, customer)
    guest = find_guest(customer)
    guest.guest_pays(cost)
  end

  def guest_buys_drink(cost, customer)
    guest = find_guest(customer)
    guest.guest_pays(cost)
  end
end
