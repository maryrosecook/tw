require_relative 'spec_helper'

describe Plateu do

    before(:each) do
      @plateu = Plateu.new(6,5)
      @rover1 = Rover.new('rover1',1,3,'N')
      @rover1.compass_no_conversion
      @rover2 = Rover.new('rover2',3,3,'E')
      @rover2.compass_no_conversion
    end

    describe 'Check the initialisation of plateu' do
      it 'Expects the plateu to be the correct size' do
        expect(@plateu.plateu[0].length).to eq 6
        expect(@plateu.plateu.length).to eq 5
    end
  end

  describe 'Checks the #update_position method' do
    it 'expects the output of #update_position to be correct' do
      expect { @plateu.update_position(@rover1) }.to change{@plateu.plateu[3- 1][1-1]}.from('x').to('N')
      expect { @plateu.update_position(@rover2) }.to change{@plateu.plateu[3-1][3-1]}.from('x').to('E')
    end
  end

end
