class Rover
  attr_accessor :name, :x, :y, :direction, :move

  def initialize(name,x,y,direction)
    @name = name
    @x = x
    @y = y
    @direction = direction
  end

  def move
    case @direction
    when 'N'
      @y += 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    when 'W'
      @x -= 1
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

  def position
    p "The position of rover is #{@x}, #{@y}, #{@direction}"
  end

end
