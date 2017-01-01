class Plateu
  attr_accessor :plateu

  def initialize(x,y)
    @plateu = []
    x.times { @plateu << x = [] }

    @plateu.each do |x|
      y.times { x << 'x' }
    end
  end

  def update_position(rover)
    @plateu[rover.x][rover.y] = "#{rover.direction}"
  end

  def print_plateu
    width = @plateu.flatten.max.size+2
    puts @plateu.map { |x| x.map { |n| n.rjust(width)}.join }
  end

end
