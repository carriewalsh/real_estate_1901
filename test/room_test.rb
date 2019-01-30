require "minitest/autorun"
require "minitest/pride"
require "./lib/room"
require "pry"

class RoomTest < MiniTest::Test
  def setup
    @room_1 = Room.new(:bedroom,10,13)
    @room_2 = Room.new(:bedroom,11,15)
    @room_3 = Room.new(:living_room,25,15)
    @room_4 = Room.new(:basement,30,41)
  end


  def test_room_exists
    assert_instance_of Room, @room_1
  end


  def test_room_has_category
    assert_equal :bedroom, @room_1.category
  end


  def test_room_has_area
    assert_equal 130, @room_1.area
  end

end
