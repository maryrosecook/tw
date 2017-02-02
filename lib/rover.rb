class Rover
  attr_accessor :name, :x, :y, :direction, :move, :compass_no

  def initialize(name,x,y,compass_no)
    @name = name
    @x = x
    @y = y
    @direction = ['N','E','S','W']
    @compass_no = compass_no
  end

  def move(plateu)
    @plateu = plateu
      case @compass_no
      when 0
         @y == @plateu.plateu.length ? raise_plateu_edge : @y += 1
      when 2
         @y == 0 ? raise_plateu_edge : @y -= 1
      when 1
        @x == @plateu.plateu[0].length ? raise_plateu_edge : @x += 1
      when 3
        @x == 0 ? raise_plateu_edge : @x -= 1
      end
  end

  def compass_no_conversion
    @direction.each { |x| @compass_no = @direction.index(x) if @compass_no == x }
  end

  def raise_plateu_edge
    raise "I'm on the edge of the plateu! Turn me around!"
  end


  def turn_left
    @compass_no == 0 ? @compass_no = 3 : @compass_no -= 1
  end

  def turn_right
    @compass_no == 3 ? @compass_no = 0 : @compass_no += 1
  end

  def position
    number = @compass_no
    p "The position of rover is #{@x}, #{@y}, #{@direction[number]}"
  end

end
