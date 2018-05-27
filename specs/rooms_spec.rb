require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../guests.rb")

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("The Red Room", 15, 5, [])
  end

  def test_room_has_name
    assert_equal("The Red Room", @room.name())
  end

  def test_room_has_size
    assert_equal(15, @room.size())
  end

  def test_room_has_cost
    assert_equal(5, @room.cost())
  end

  def test_room_has_till
    assert_equal(0, @room.till())
  end

  def test_room_songs_empty
    assert_equal([], @room.songs)
  end

  def test_room_is_empty
    assert_equal([], @room.guests)
  end

  def test_number_of_people
    assert_equal(0, @room.guest_count())
  end

  def test_number_of_songs
    assert_equal(0, @room.song_count())
  end

  def test_add_song
    @room.add_song("All Along the Watchtower", "Jimi Hendrix")
    assert_equal(1 , @room.song_count())
  end

  def test_add_guest
    @room.add_guest("Bob", 100, "All Along the Watchtower", @room.cost)
    assert_equal(1, @room.guest_count())
  end

  def test_remove_guest
    @room.remove_guest("Bob")
    assert_equal(0, @room.guest_count)
  end

  def test_too_many_people
    @room2 = Room.new("The Red Room", 1, 1, [])
    @room2.add_guest("Bob", 100, "All Along the Watchtower", @room2.cost)
    result = @room2.add_guest("Charlie", 250, "No Angel", @room2.cost)
    assert_equal("Room at capacity", result)
  end

  def test_has_song
    @room.add_song("All Along the Watchtower", "Jimi Hendrix")
    @room.add_song("No Angel", "Dido")
    @room.add_song("Radio Ga Ga", "The Beatles")
    @room.add_guest("Bob", 100, "All Along the Watchtower", @room.cost)
    result = @room.fav_song_roar("Bob")
    assert_equal("Whoo!", result)
  end

  def test_guest_pays
    @room.add_guest("Bob", 100, "All Along the Watchtower", @room.cost)
    assert_equal(5, @room.till)
    guest = @room.find_guest("Bob")
    result = guest.money
    assert_equal(95, result)
  end

  def test_has_not_song
    @room.add_song("All Along the Watchtower", "Jimi Hendrix")
    @room.add_song("No Angel", "Dido")
    @room.add_song("Radio Ga Ga", "The Beatles")
    @room.add_guest("Steve", 100, "Englishman in New York", @room.cost)
    result = @room.fav_song_roar("Steve")
    assert_equal("Sorry", result)
  end

end
