class Food

  attr_accessor :name, :cost
  attr_accessor :stock

  def initialize(name, cost, stock)
    @name = name
    @cost = cost
    @stock = stock
  end

  def add_food_stock(num)
    @stock += num
  end

end
