require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"
require "pry"

class HouseTest < MiniTest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom,10,13)
    @room_2 = Room.new(:bedroom,11,15)
    @room_3 = Room.new(:living_room,25,15)
    @room_4 = Room.new(:basement,30,41)
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
  end

  def test_house_exists
    assert_instance_of House, @house
  end


  def test_house_has_price
    assert_equal "$400000", @house.price
  end


  def test_house_has_address
    assert_equal "123 sugar lane", @house.address
  end


  def test_house_starts_with_no_rooms
    new_house = House.new("$1", "123 fake st")
    assert_equal 0, new_house.rooms.length
  end


  def test_rooms_added_to_house
    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms
  end


  def test_can_select_rooms_of_category_in_house
    assert_equal [@room_1, @room_2], @house.category(:bedroom)
  end


  def test_can_select_rooms_of_different_category_in_house
    assert_equal [@room_4], @house.category(:basement)
  end


  def test_can_find_area_of_house
    assert_equal 1900, @house.area
  end


  def test_can_find_price_per_square_foot
    assert_equal 210.53, @house.price_per_square_foot
  end


  def test_can_sort_rooms_by_area
    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  end


  def test_can_sort_rooms_by_category
    assert_equal @house.rooms_hash , @house.rooms_by_category
  end

end
