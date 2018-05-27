require("minitest/autorun")
require("minitest/rg")
require_relative("../guests.rb")


class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Bob", 100, "All along the Watchtower")
  end

  def test_guest_has_name
    assert_equal("Bob", @guest.name)
  end

  def test_guest_has_money
    assert_equal(100, @guest.money)
  end

  def test_guest_has_fav_song
    assert_equal("All along the Watchtower", @guest.fav_song)
  end
end
