require_relative 'spec_helper'

describe Rover do

  before(:each) do
    @rover1 = Rover.new('rover1',1,3,'N')
    @rover2 = Rover.new('rover2',3,3,'E')
    @rover3 = Rover.new('rover1',1,3,'S')
    @rover4 = Rover.new('rover2',3,3,'W')
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.x).to eq 1
      expect(@rover2.x).to eq 3
      expect(@rover1.y).to eq 3
      expect(@rover2.y).to eq 3
      expect(@rover1.name).to eq 'rover1'
      expect(@rover2.name).to eq 'rover2'

    end
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.direction).to eq 'N'
      expect(@rover2.direction).to eq 'E'
    end
  end

  describe 'Checks #turn_left method.' do
    it 'Changes the .direction attribute so that the rover turns left' do
        @rover1.turn_left
        @rover2.turn_left
        expect(@rover1.direction).to eq 'W'
        expect(@rover2.direction).to eq 'N'
    end
  end

  describe 'Checks #turn_right method.' do
    it 'Changes the .direction attribute so that the rover turns right' do
        @rover1.turn_right
        @rover2.turn_right
        expect(@rover1.direction).to eq 'E'
        expect(@rover2.direction).to eq 'S'
    end
  end

  describe 'Checks #move method' do
    it 'Changes the position of the rover by one when direction is north or east' do
      expect { @rover1.move }.to change{@rover1.y}.by(1)
      expect { @rover2.move }.to change{@rover2.x}.by(1)
    end
  end

  describe 'Checks #move method' do
    it 'Changes the position of the rover by one when direction is south or west' do
      expect { @rover3.move }.to change{@rover3.y}.from(3).to(2)
      expect { @rover4.move }.to change{@rover4.x}.from(3).to(2)
    end
  end

  describe 'Checks #move method' do
    it 'Expects and error message when the bot reaches the edge of the plateu' do
      expect{ @rover3.move }.to raise_error "I'm on the edge of the plateu! Turn me around!"
      expect{ @rover4.move }.to raise_error "I'm on the edge of the plateu! Turn me around!"
    end
  end


  describe 'Checks #status method' do
    it 'Expects the rover to return its position' do
      expect { @rover1.position }.to output{'1,3,N'}.to_stdout
      expect { @rover2.position }.to output{'3,3,E'}.to_stdout
    end
  end



end
