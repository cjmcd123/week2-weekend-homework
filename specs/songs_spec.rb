require("minitest/autorun")
require("minitest/rg")

require_relative("../songs.rb")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("All along the Watchtower", "Jimi Hendrix")
  end

  def test_song_has_name
    assert_equal("All along the Watchtower", @song.name())
  end

  def test_song_has_artist
    assert_equal("Jimi Hendrix", @song.artist())
  end
end
