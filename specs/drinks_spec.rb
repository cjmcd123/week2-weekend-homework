require("minitest/autorun")
require("minitest/rg")

require_relative("../drinks.rb")

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 7, 30)
    @drink2 = Drink.new("cider", 6, 10)
    @drink3 = Drink.new("lemonade", 4, 50)
  end

  def test_drink_has_name
    assert_equal("beer", @drink1.name())
  end

  def test_drink_has_price
    assert_equal(6, @drink2.cost())
  end

  def test_drink_has_stock
    assert_equal(50, @drink3.stock)
  end

  def test_add_stock
    @drink2.add_stock(30)
    assert_equal(40, @drink2.stock)
  end
end
