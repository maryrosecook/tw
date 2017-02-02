require_relative 'spec_helper'

describe Rover do

  before(:each) do
    @rover1 = Rover.new('rover1',1,3,0)
    @rover2 = Rover.new('rover2',3,3,1)
    @rover3 = Rover.new('rover1',1,3,2)
    @rover4 = Rover.new('rover2',3,3,3)
    @rover5 = Rover.new('rover2',3,3,'N')
    @plateu = Plateu.new(5,5)
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.x).to eq 1
      expect(@rover2.x).to eq 3
      expect(@rover1.y).to eq 3
      expect(@rover2.y).to eq 3
      expect(@rover1.compass_no).to eq 0
      expect(@rover1.name).to eq 'rover1'
      expect(@rover2.name).to eq 'rover2'

    end
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.direction[@rover1.compass_no]).to eq 'N'
      expect(@rover2.direction[@rover2.compass_no]).to eq 'E'
    end
  end

  describe 'Checks #turn_left method.' do
    it 'Changes the .direction attribute so that the rover turns left' do
        expect { @rover1.turn_left }.to change{@rover1.compass_no}.from(0).to(3)
        expect { @rover2.turn_left }.to change{@rover2.compass_no}.from(1).to(0)
    end
  end

  describe 'Checks #turn_right method.' do
    it 'Changes the .direction attribute so that the rover turns right' do
        expect { @rover1.turn_right }.to change{@rover1.compass_no}.by(1)
        expect { @rover2.turn_right }.to change{@rover2.compass_no}.by(1)
    end
  end

  describe 'Checks #move method' do
    it 'Changes the position of the rover by one when direction is north or east' do
      expect { @rover1.move(@plateu) }.to change{@rover1.y}.by(1)
      expect { @rover2.move(@plateu) }.to change{@rover2.x}.by(1)
    end
  end

  describe 'Checks #move method' do
    it 'Changes the position of the rover by one when direction is south or west' do
      expect { @rover3.move(@plateu) }.to change{@rover3.y}.from(3).to(2)
      expect { @rover4.move(@plateu) }.to change{@rover4.x}.from(3).to(2)
    end
  end

  describe 'Checks #move method' do
    it 'Expects and error message when the bot reaches the edge of the plateu' do
      @rover1.y = 5
      @rover2.x = 5
      @rover3.y = 0
      @rover4.x = 0
      expect{ @rover1.move(@plateu) }.to raise_error "I'm on the edge of the plateu! Turn me around!"
      expect{ @rover2.move(@plateu) }.to raise_error "I'm on the edge of the plateu! Turn me around!"
      expect{ @rover3.move(@plateu) }.to raise_error "I'm on the edge of the plateu! Turn me around!"
      expect{ @rover4.move(@plateu) }.to raise_error "I'm on the edge of the plateu! Turn me around!"
    end
  end


  describe 'Checks #status method' do
    it 'Expects the rover to return its position' do
      expect { @rover1.position }.to output{'1,3,N'}.to_stdout
      expect { @rover2.position }.to output{'3,3,E'}.to_stdout
    end
  end

  describe 'Checks #conversion method' do
    it 'Expects the letter for the init position to be converted to a number' do
      expect { @rover5.compass_no_conversion }.to change{@rover5.compass_no}.from('N').to(0)
    end
  end


end
