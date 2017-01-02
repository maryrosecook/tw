class Control
  require_relative './plateu'
  require_relative './rover'
  require_relative './houston_command'
  attr_accessor :x, :y, :plateu, :rover, :commands

  def interface(string)
    @command_array = string
    @command_array = @command_array.split(',')
    set_up_plateu(@command_array)
    delete_first_two(@command_array)
    co_ordinates_for_rover(@command_array)
    delete_first_three(@command_array)
    commands_for_rover(@command_array)
    @rover.position
    delete_commands(@command_array)
  end


  def co_ordinates_for_rover(array)
    coords = []
    coords << array[0].to_i
    coords << array[1].to_i
    coords << array[2]
    set_up_rover(coords)
  end

  def delete_first_two(array)
    array.delete_at(0)
    array.delete_at(1)
  end

  def delete_first_three(array)
    array.delete_at(0)
    array.delete_at(1)
    array.delete_at(2)
  end

  def delete_commands(array)
    array = array.drop_while { |x| x == 'R' || x == 'L' || x == 'M' }
  end

  def set_up_plateu(array)
    @x = array[0].to_i
    @y = array[1].to_i
    @plateu = Plateu.new(@x, @y)
  end

  def set_up_rover(array)
    @rover = Rover.new('rover', array[0], array[1], array[2])
    @rover.position
  end

  def commands_for_rover(array)
    @commands = array.take_while { |x| x == 'R' || x == 'L' || x == 'M'}
    send_command(@commands, @rover)
  end


  def send_command(commands, rover)
    commands.each do |x|
      case x
      when "R"
        @rover.turn_right
      when "L"
        @rover.turn_left
      when "M"
        @rover.move(@plateu)
      end
    end
  end

end
