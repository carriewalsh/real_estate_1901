require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

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

end
