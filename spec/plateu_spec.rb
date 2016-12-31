require_relative 'spec_helper'

describe Plateu do

    before(:each) do
      @plateu = Plateu.new(5,5)
    end

    describe 'Check the initialisation of plateu' do
      it 'Expects the plateu to be the correct size' do
        expect(@plateu.length).to eq 5
        expect(@plateu[0].length).to eq 5
    end
  end

end
