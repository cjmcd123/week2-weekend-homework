require("minitest/autorun")
require("minitest/rg")

require_relative("../food.rb")

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("pizza", 15, 20)
    @food2 = Food.new("burger", 12, 12)
    @food3 = Food.new("chicken burger", 10, 25)
    @food4 = Food.new("crisps", 5, 50)
    @food5 = Food.new("peanuts", 3, 30)
  end

  def test_food_has_name
    assert_equal("pizza", @food1.name())
  end

  def test_food_has_price
    assert_equal(12, @food2.cost())
  end

  def test_food_has_stock
    assert_equal(25, @food3.stock)
  end

  def test_add_stock
    @food1.add_stock(5)
    assert_equal(25, @food1.stock)
  end
end
