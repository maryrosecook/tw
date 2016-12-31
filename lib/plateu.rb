class Plateu
  attr_accessor :plateu
  
  def initialize(x,y)
    @plateu = []
    x.times { @plateu << x = []}

    @plateu.each do |x|
      y.times { x << 'x' }
    end
  end

end
