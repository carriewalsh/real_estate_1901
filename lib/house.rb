class House
  attr_reader :price, :address, :rooms
  def initialize(price,address)
    @price = price
    @address = address
    @rooms = []
  end


  def add_room(room)
    @rooms << room
  end


  def category(category)
    category_arr = []
    @rooms.map do |room|
      if room.category == category
        category_arr << room
      end
    end
    return category_arr
  end


  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end
    return area
  end

end
