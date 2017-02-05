class Input
  require_relative './control'

  attr_reader :path, :control

  def initialize
    @path = ''
    @control = Control.new
  end

  def get_input
    puts "This is Houston Control Super Space Command \n Please enter the file path of the file that contains the intructions for the Mars Rover Space Mission \n "
    @path = gets.chomp
    start_input(@path)
  end

  def start_input(path)
    open_and_read_file(path)
    format_file_contents(@contents)
  end

  def open_and_read_file(path)
    file = File.open(path, "r")
    @contents = file.read
  end

  def format_file_contents(contents)
    @contents = @contents.chomp.split('')
    @contents = @contents.each { |x| @contents.delete_at(@contents.index(x)) if x == "\n" || x == " "}
    @control.command_rover(@contents)
  end

end
