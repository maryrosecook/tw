require_relative 'spec_helper'

describe Houston_command do

  before(:each) do
    @houston_command = Houston_command.new
    @rover1 = Rover.new('rover1',1,3,'N')
    @rover2 = Rover.new('rover2',3,3,'E')
    @plateu = Plateu.new(5,5)
  end

  describe 'Tests for movement methods' do

    describe 'Checks #rover_move method' do
      it 'expects rover to return updated position' do
        expect { @houston_command.rover_move(@rover1, @plateu) }.to change{ @rover1.y }.by(1)
        expect { @houston_command.rover_move(@rover2, @plateu) }.to change{ @rover2.x }.by(1)
      end
    end

    describe 'Checks #rover_turn_left method' do
      it 'expects rover to return updated direction' do
        expect { @houston_command.rover_turn_left(@rover1) }.to change{ @rover1.direction }.from('N').to('W')
        expect { @houston_command.rover_turn_left(@rover2) }.to change{ @rover2.direction }.from('E').to('N')
      end
    end

    describe 'Checks #rover_turn_right method' do
      it 'expects rover to return updated direction' do
        expect { @houston_command.rover_turn_right(@rover1) }.to change{ @rover1.direction }.from('N').to('E')
        expect { @houston_command.rover_turn_right(@rover2) }.to change{ @rover2.direction }.from('E').to('S')
      end
    end

  end

  describe 'Tests for checking rover postion' do
    it 'expects rover to return position' do
        expect { @houston_command.position_of(@rover1) }.to output{'1,3,N'}.to_stdout
        expect { @houston_command.position_of(@rover2) }.to output{'3,3,E'}.to_stdout
    end
  end

end
