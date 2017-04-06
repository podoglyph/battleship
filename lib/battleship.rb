require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Battleship
  attr_reader :player, :computer, :deploy_location2, :deploy_location3, :coordinates

  def initialize
    @player = Player.new
    @grid = Grid.new
    run
  end

  def welcome_prompt
    puts Messages.welcome
    user_input = gets.chomp.upcase

    if user_input == 'P' || user_input == 'PLAY'
      start_game
    elsif user_input == 'I' || user_input == 'INSTRUCTIONS'
      puts Messages.instructions
      welcome_prompt
    elsif user_input == 'Q' || user_input == 'QUIT'
      puts Messages.quit_game
    else
      puts "Please enter a valid response."
      welcome_prompt
    end
  end

  def start_game
    puts "Please wait while the computer chooses its positions."
    @computer = Computer.new
    prepare_computer_ships
  end

  def prepare_computer_ships
    @deploy_location2 = computer.two_unit_ship.location
    @deploy_location3 = computer.three_unit_ship.location
    locate_destination #[[2, 0], [3, 0], [1, 0]]
  end

  def locate_destination
    row1 = @grid.game_grid[0]

    row1.each do |i|
      @coordinates = []
      @coordinates << i.x << i.y
      print coordinates
    end

    row2 = @grid.game_grid[1]

    row3 = @grid.game_grid[2]

    row4 = @grid.game_grid[3]

    binding.pry
  end

  def run
    welcome_prompt
  end

end
b = Battleship.new
binding.pry
""
