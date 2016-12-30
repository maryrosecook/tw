require_relative 'spec_helper'

describe Rover do

  before(:each) do
    @rover1 = Rover.new(1,3,'N')
    @rover2 = Rover.new(3,3,'E')
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.x).to eq 1
      expect(@rover2.x).to eq 3
      expect(@rover1.y).to eq 3
      expect(@rover2.y).to eq 3
    end
  end

  describe 'Checks initialisation.' do
    it 'Specifically the co-ordinates of rover when initialised.' do
      expect(@rover1.facing).to eq 'N'
      expect(@rover2.facing).to eq 'E'
    end
  end


end
