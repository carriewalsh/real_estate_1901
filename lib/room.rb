class Room
  attr_reader :category, :length, :width, :area
  def initialize(category,length,width)
    @category = category
    @length = length
    @width = width
  end


  def area
    @area = @length * @width
  end

end
