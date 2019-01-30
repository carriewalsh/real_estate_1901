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
    assert_equal 0, @house.rooms.length
  end


  def test_rooms_added_to_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms
  end


  def test_can_select_category_of_room_in_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.category(:bedroom)
  end


  def test_can_select_different_category_of_room_in_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4], @house.category(:basement)
  end


  def test_can_find_area_of_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end


  def test_find_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end


  def test_rooms_sort_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  end


  def test_rooms_sort_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal @house.rooms_hash , @house.rooms_by_category
  end

end
