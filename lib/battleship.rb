require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Battleship
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
    run
  end

  def welcome_prompt
    puts Messages.welcome
    user_input = gets.chomp.downcase

    if user_input == 'p' || user_input == 'play'
      start_game
    elsif user_input == 'i' || user_input == 'instructions'
      puts Messages.instructions
    elsif user_input == 'q' || user_input == 'quit'
      puts Messages.quit_game
    else
      puts "Please enter a valid response."
      welcome_prompt
    end
  end

  def start_game
    puts "Please wait while the computer chooses its positions."
    computer.place_ships
  end

  def run
    welcome_prompt
  end

end

b = Battleship.new
