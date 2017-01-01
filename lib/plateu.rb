class Plateu
  attr_accessor :plateu

  def initialize(x,y)
    @plateu = []
    y.times { @plateu << [] }

    @plateu.each do |n|
      x.times { n << 'x' }
    end
  end

  def update_position(rover)
    @plateu[rover.x][rover.y] = "#{rover.direction}"
  end

  def print_plateu
    width = @plateu.flatten.reverse.max.size+2
    puts @plateu.reverse.map { |x| x.map { |n| n.rjust(width)}.join }
  end

end
