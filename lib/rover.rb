class Rover
  attr_accessor :name, :x, :y, :direction, :move

  def initialize(name,x,y,direction)
    @name = name
    @x = x
    @y = y
    @direction = direction
  end

  def move(plateu)
      case @direction
      when 'N'
        raise "I'm on the edge of the plateu! Turn me around!" if @y == plateu.plateu.length
        @y += 1
      when 'S'
        raise "I'm on the edge of the plateu! Turn me around!" if @y == 0
        @y -= 1
      when 'E'
        raise "I'm on the edge of the plateu! Turn me around!" if @x == plateu.plateu[0].length
        @x += 1
      when 'W'
        raise "I'm on the edge of the plateu! Turn me around!" if @x == 0
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
