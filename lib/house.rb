class House
  attr_reader :price, :address, :rooms, :rooms_hash
  def initialize(price,address)
    @price = price
    @address = address
    @rooms = []
    @rooms_hash = Hash.new {|hash,key| hash[key] = []}
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
    category_arr
  end


  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end
    area
  end


  def price_per_square_foot
    price = @price[1..@price.length].to_f
    (price / area).round(2)
  end


  def rooms_sorted_by_area
    area_array = @rooms.sort_by do |room|
      room.area
    end
    area_array.reverse
  end


  def rooms_by_category
    @rooms.each do |room|
      @rooms_hash[room.category] << room
    end
    @rooms_hash
  end

end
