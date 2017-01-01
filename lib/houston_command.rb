class Houston_command

  def rover_move(rover, plateu)
    rover.move(plateu)
  end

  def rover_turn_left(rover)
    rover.turn_left
  end

  def rover_turn_right(rover)
    rover.turn_right
  end

  def position_of(rover)
    rover.position
  end

end
