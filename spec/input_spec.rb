require_relative 'spec_helper'

describe Input do

  before(:each) do
    @input = Input.new
  end

  # describe '#start_input' do
  #   it 'should take file and read it into the instance of control' do
  #     expect { @input.start_input("/Users/thomaswilliampage/Documents/tech_tests/mars_rover/text.txt") }.to output("\"The position of rover is 1, 3, N\"\n\"The position of rover is 5, 1, E\"\n").to_stdout
  #   end
  # end

  describe '#get_input' do
    it 'should get the file path and start the #start_input method' do
      expect { @input.get_input }.to output("Please type the path of the file that you wish to use\n").to_stdout
      expect { @input.get_input }.to change { @input.path }.from('')
    end
  end

end
