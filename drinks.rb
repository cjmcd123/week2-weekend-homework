class Drink

  attr_accessor :name, :cost
  attr_accessor :stock

  def initialize(name, cost, stock)
    @name = name
    @cost = cost
    @stock = stock
  end

  def add_drink_stock(num)
    @stock += num
  end

end
