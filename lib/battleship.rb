require './lib/required_files.rb'
require 'pry'

class Battleship
  include Messages
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    welcome_prompt
  end

  def welcome_prompt
    welcome_message
    user_input = gets.chomp.upcase

    if user_input == 'P' || user_input == 'PLAY'
      start_game
    elsif user_input == 'I' || user_input == 'INSTRUCTIONS'
      instructions_message
      welcome_prompt
    elsif user_input == 'Q' || user_input == 'QUIT'
      quit_game_message
    else
      invalid_response_message
      welcome_prompt
    end
  end

  def start_game
    start_game_message
    @computer = Computer.new
    computer.place_ship(2)
    computer.place_ship(3)
  end

end
