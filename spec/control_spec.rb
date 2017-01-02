require_relative 'spec_helper'

describe Control do

  before(:each) do
    @control = Control.new
    @command_array = ["5", "5", "1", "2", "N", "L", "M", "L", "M", "L", "M", "L", "M", "M", "3", "3", "E", "M", "M", "R", "M", "M", "R", "M", "R", "R", "M"]
    #@control.interface("5,5,1,2,N,L,M,L,M,L,M,L,M,M,3,3,E,M,M,R,M,M,R,M,R,R,M")
  end

  describe '#set_up_plateu' do
    it 'it expects that the plateau should be the right size' do
      @control.set_up_plateu(@command_array)
      expect(@control.plateu.plateu[0].length).to eq 5
      expect(@control.plateu.plateu.length).to eq 5
    end
  end

  describe '#delete_first_two' do
    it 'it expects that command array will change by two' do
      expect { @control.delete_first_two(@command_array) }.to change{ @command_array.length }.by -2
    end
  end

  describe '#delete_first_two' do
    it 'it expects that command array will change by two' do
      expect { @control.delete_first_three(@command_array) }.to change{ @command_array.length }.by -3
    end
  end


  describe '#co_ordinates_for_rover and #set_up_rover' do
    it 'it expects the rover to be set up in the correct position' do
      @control.co_ordinates_for_rover(['1','1','N'])
      expect(@control.rover.x).to eq 1
      expect(@control.rover.y).to eq 1
      expect(@control.rover.direction).to eq 'N'
    end
  end

  describe '#commands_for_rover' do
    it 'it expects the commands to be sent to the rover' do
      @control.set_up_rover([1,2,'N'])
      @control.set_up_plateu([5,5])
      @control.commands_for_rover(["L", "M", "L", "M", "L", "M", "L", "M", "M", "3", "3", "E", "M", "M", "R", "M", "M", "R", "M", "R", "R", "M"])
      expect(@control.commands).to eq(["L", "M", "L", "M", "L", "M", "L", "M", "M"])
      expect(@control.rover.position).to eq "The position of rover is 1, 3, N"
    end
  end

#   describe 'Checks that control has initialized everything' do
#     it 'It expects plateu to be the correct size.' do
#       expect(@control.plateu.plateu.length).to eq 5
#       expect(@control.plateu.plateu[0].length).to eq 5
#     end
#
#     it 'It expects the first rover to have the correct co-oridinates.' do
#       expect(@rover1.x).to eq 1
#       expect(@rover1.x).to eq 2
#       expect(@rover1.direction).to eq 'N'
#     end
#   end
#
#   it 'It expects the second rover to have the correct co-oridinates.' do
#     expect(@rover2.x).to eq 3
#     expect(@rover2.x).to eq 3
#     expect(@rover2.direction).to eq 'E'
#   end
# end
#
# describe 'Checks that the move and turn functions work' do
#   it 'It expects the finishing co-ordinates for the first rover to be correct' do
#     expect(@rover1.x).to eq 3
#     expect(@rover1.x).to eq 3
#     expect(@rover1.direction).to eq 'E'
#   end
#
#   it 'It expects the finishing co-ordinates for the first rover to be correct'do
#     expect(@rover2.x).to eq 3
#     expect(@rover2.x).to eq 3
#     expect(@rover2.direction).to eq 'E'
#   end
end
