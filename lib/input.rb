class Input
  require_relative './control'

  attr_reader :path, :control

  def initialize
    @path = ''
    @control = Control.new
  end



  def get_input
    puts 'Please type the path of the file that you wish to use'
    @path = gets.chomp
    start_input(@path)
  end

  def start_input(path)
    file = File.open(path, "r")
    @contents = file.read
    @contents = @contents.chomp.split('')
    @contents = @contents.each { |x| @contents.delete_at(@contents.index(x)) if x == "\n" || x == " "}
    @control.command_rover(@contents)
  end


end
