class Control
  require_relative './plateu'
  require_relative './rover'
  require_relative './houston_command'
  attr_accessor :x, :y, :plateu, :rover, :commands, :command_array

  def command_rover(string)
    @command_array = string
    set_up_plateu_and_delete
    set_up_rover_and_send_commands
     while check_for_commands(@command_array)
       reset_rover_and_send_commands
     end
  end

  def set_up_plateu_and_delete
    set_up_plateu(@command_array)
    delete_first_two(@command_array)
  end

  def set_up_rover_and_send_commands
    co_ordinates_for_rover(@command_array)
    delete_first_three(@command_array)
    commands_for_rover(@command_array)
    show_rover
    @command_array = delete_commands(@command_array)
  end

  def check_for_commands(array)
    array.length > 0
  end

  def reset_rover_and_send_commands
    reset_rover(@command_array)
    delete_first_three(@command_array)
    commands_for_rover(@command_array)
    show_rover
    @command_array = delete_commands(@command_array)
  end

  def show_rover
    print_rover_position
    print_plateu_map
  end

  def print_rover_position
    @rover.position
  end

  def print_plateu_map
    @plateu.update_position(@rover)
    @plateu.print_plateu
  end

  def co_ordinates_for_rover(array)
    coords = []
    coords << array[0].to_i
    coords << array[1].to_i
    coords << array[2]
    set_up_rover(coords)
  end

  def delete_first_two(array)
    2.times { array.delete_at(0) }
  end

  def delete_first_three(array)
    3.times { array.delete_at(0) }
  end

  def delete_commands(array)
    array.drop_while { |x| x == 'R' || x == 'L' || x == 'M' }
  end

  def set_up_plateu(array)
    @x = array[0].to_i
    @y = array[1].to_i
    @plateu = Plateu.new(@x, @y)
  end

  def set_up_rover(array)
    @rover = Rover.new('rover', array[0], array[1], array[2])
    @rover.compass_no_conversion
  end

  def reset_rover(array)
    @rover.x = array[0].to_i
    @rover.y = array[1].to_i
    @rover.compass_no = array[2]
    @rover.compass_no_conversion
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
