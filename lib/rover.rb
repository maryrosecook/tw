class Rover
  attr_accessor :x, :y, :direction, :move

  def initialize(x,y,direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
    if @direction == 'N' || @direction == 'S'
      @y += 1
    else
      @x += 1
    end
  end


  def turn_left
    case @direction
    when 'N'
      @direction = 'W'
    when 'W'
      @direction = 'S'
    when 'S'
      @direction = 'E'
    when 'E'
      @direction = 'N'
    else
      'There has been a problem turning left'
    end
  end

  def turn_right
    case @direction
    when 'N'
      @direction = 'E'
    when 'E'
      @direction = 'S'
    when 'S'
      @direction = 'W'
    when 'W'
      @direction = 'N'
    else
      'There has been a problem turning right'
    end
  end

end
