require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../guests.rb")
require_relative("../bar.rb")
require_relative("../drinks.rb")
require_relative("../food.rb")

class BarTest < MiniTest::Test

  def setup
    @room1 = Room.new("The Red Room", 15, 5, [])
    @room2 = Room.new("The Blue Room", 25, 15, [])
    @room3 = Room.new("The Green Room", 10, 10, [])

    @food1 = Food.new("pizza", 15, 20)
    @food2 = Food.new("burger", 12, 12)
    @food3 = Food.new("chicken burger", 10, 25)
    @food4 = Food.new("crisps", 5, 50)
    @food5 = Food.new("peanuts", 3, 30)

    @drink1 = Drink.new("beer", 7, 30)
    @drink2 = Drink.new("cider", 6, 10)
    @drink3 = Drink.new("lemonade", 4, 50)

    foods = [@food1, @food2, @food3, @food4, @food5]
    drinks = [@drink1, @drink2, @drink3]
    rooms = [@room1, @room2, @room3]
    @bar = Bar.new("The Codeclan Bar", rooms, 200, foods, drinks)
  end

  def test_bar_has_name
    assert_equal("The Codeclan Bar", @bar.name())
  end

  def test_bar_has_rooms
    assert_equal(3, @bar.room_count())
  end

  def test_room_has_till
    assert_equal(200, @bar.till())
  end

  def test_bar_has_food
    assert_equal(["pizza", "burger", "chicken burger", "crisps", "peanuts"], @bar.list_food)
  end

  def test_bar_has_drinks
    assert_equal(["beer", "cider", "lemonade"], @bar.list_drinks)
  end

  def test_check_stock_food
    result = @bar.stock_check_drink("beer")
    assert_equal(30, result)
  end

  def test_check_stock_food
    result = @bar.stock_check_food("pizza")
    assert_equal(20, result)
  end

  def test_add_guest_from_room
    @bar.add_guest_to_room("Bob", 100, "All Along the Watchtower", "The Red Room")
    assert_equal(1, @bar.guest_count("The Red Room"))
    guest = @bar.find_guest_in_room("Bob", "The Red Room")
    result = guest.money
    assert_equal(95, result)
  end

  def test_remove_guest_from_room
    @bar.add_guest_to_room("Bob", 100, "All Along the Watchtower", "The Red Room")
    @bar.remove_guest_from_room("Bob", "The Red Room")
    assert_equal(0, @bar.guest_count("The Red Room"))
  end

  def test_too_many_people
    room4 = Room.new("The Red Room", 1, 1, [])
    room5 = Room.new("The Blue Room", 1, 1, [])
    rooms = [room4, room5]
    bar2 = Bar.new("Test Bar", rooms, 100, [], [])
    bar2.add_guest_to_room("Bob", 100, "All Along the Watchtower", "The Red Room")
    result = bar2.add_guest_to_room("Charlie", 250, "No Angel", "The Red Room")
    assert_equal("Room at capacity", result)
  end

  def test_add_stock_drink
    @bar.add_stock_drink(5, "beer")
    assert_equal(35, @bar.stock_check_drink("beer"))
  end

  def test_add_stock_food
    @bar.add_stock_food(5, "pizza")
    assert_equal(25, @bar.stock_check_food("pizza"))
  end

  def test_guest_buys_food
    @bar.add_guest_to_room("Bob", 100, "All Along the Watchtower", "The Red Room")
    @bar.bar_sells_food("pizza", "Bob", "The Red Room")
    assert_equal(220, @bar.till)
    customer = @bar.find_guest_in_room("Bob", "The Red Room")
    cash = customer.money
    assert_equal(80, cash)
  end

  def test_guest_buys_drink
    @bar.add_guest_to_room("Bob", 100, "All Along the Watchtower", "The Red Room")
    @bar.bar_sells_drink("beer", "Bob", "The Red Room")
    assert_equal(212, @bar.till)
    customer = @bar.find_guest_in_room("Bob", "The Red Room")
    cash = customer.money
    assert_equal(88, cash)
  end

end
