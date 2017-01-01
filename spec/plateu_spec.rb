require_relative 'spec_helper'

describe Plateu do

    before(:each) do
      @plateu = Plateu.new(6,5)
      @rover1 = Rover.new('rover1',1,3,'N')
      @rover2 = Rover.new('rover2',3,3,'E')
    end

    describe 'Check the initialisation of plateu' do
      it 'Expects the plateu to be the correct size' do
        expect(@plateu.plateu.length).to eq 5
        expect(@plateu.plateu[0].length).to eq 5
    end
  end

  describe 'Checks the #update_position method' do
    it 'expects the output of #update_position to be correct' do
      expect { @plateu.update_position(@rover1) }.to change{@plateu.plateu[1][3]}.from('x').to('N')
      expect { @plateu.update_position(@rover2) }.to change{@plateu.plateu[3][3]}.from('x').to('E')
    end
  end

  # describe 'Checks the #print_plateu method' do
  #   it 'It expects it to print out the plateu with the rover direction', :focus => true do
  #     expect { @plateu.print_plateu }.to output{  }.to_stdout
  #   end
  # end
end
