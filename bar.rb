require("pry")
class Bar

  attr_reader :name, :rooms
  attr_accessor :till, :food, :drinks

  def initialize(name, rooms, till, food, drinks)
    @name = name
    @rooms = rooms
    @till = till
    @food = food
    @drinks = drinks
  end

  def room_count()
    return @rooms.length()
  end

  def guest_count(room_name)
    room = find_room(room_name)
    result = room.guest_count
    return result
  end

  def find_room(room_name)
    for room in @rooms
      if room.name == room_name
        return room
      end
    end
  end

  def add_guest_to_room(name, money, fav_song, room_name)
    room = find_room(room_name)
    guests = room.guest_count
    if guests <= room.size
      price = room.cost
      room.add_guest(name, money, fav_song, price)
      @till += room.cost
    end
    return "Room at capacity"
  end

  def remove_guest_from_room(name, room_name)
    room = find_room(room_name)
    room.remove_guest(name)
  end

  def list_food
    result = []
    for dish in @food
      result << dish.name
    end
    return result
  end

  def list_drinks
    result = []
    for drink in @drinks
      result << drink.name
    end
    return result
  end

  def find_drink(drink_name)
    for drink in @drinks
      if drink.name == drink_name
        return drink
      end
    end
  end

  def find_food(food_name)
    for dish in @food
      if dish.name == food_name
        return dish
      end
    end
  end

  def stock_check_food(food_name)
    dish = find_food(food_name)
    return dish.stock
  end

  def stock_check_drink(drink_name)
    drink = find_drink(drink_name)
    return drink.stock
  end

  def add_stock_food(ammount, food_name)
    dish = find_food(food_name)
    dish.add_food_stock(ammount)
  end

  def add_stock_drink(ammount, drink_name)
    drink = find_drink(drink_name)
    drink.add_drink_stock(ammount)
  end

  def find_guest_in_room(guest, room_name)
    room = find_room(room_name)
    customer = room.find_guest(guest)
    return customer
  end

  def find_food_cost(dish)
    food = find_food(dish)
    return food.cost
  end

  def find_drink_cost(drink)
    a_drink = find_drink(drink)
    return a_drink.cost
  end

  def bar_sells_food(dish, customer, room_name)
    room = find_room(room_name)
    food_cost = find_food_cost(dish)
    room.guest_buys_food(food_cost, customer)
    @till += food_cost
  end

  def bar_sells_drink(drink, customer, room_name)
    room = find_room(room_name)
    drink_cost = find_drink_cost(drink)
    room.guest_buys_drink(drink_cost, customer)
    @till += drink_cost
  end

end
