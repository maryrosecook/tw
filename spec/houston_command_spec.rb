require_relative 'spec_helper'

describe Houston_command do

  before(:each) do
    @houston_command = Houston_command.new
    @rover1 = Rover.new(1,3,'N')
    @rover2 = Rover.new(3,3,'E')
  end


  describe 'Checks #rover_move method' do
    it 'expects rover to return updated position' do
      expect { @houston_command.rover_move(@rover1) }.to change{ @rover1.y }.by(1)
      expect { @houston_command.rover_move(@rover1) }.to change{ @rover2.x }.by(1)
    end
  end

end
