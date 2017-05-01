require './lib/required_files.rb'
require 'pry'

class Battleship
  include Messages
  include Validator

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
    player_choice_two_ship
  end

  def player_choice_two_ship
    place_your_ships_message
    input = gets.chomp.upcase
    input = input.split(" ")
    if verify_coordinates(input, player.grid) == false
      player_choice_two_ship
    else
      player.place_ships(input, 2)
      player_choice_three_ship
    end
  end

  def player_choice_three_ship
    place_your_second_ship_message
    input = gets.chomp.upcase
    input = input.split(" ")
    if verify_coordinates(input, player.grid) == false
      player_choice_three_ship
    else
      player.place_ships(input, 3)
      game_sequence
    end
  end

  def game_sequence
    shoot_message
    game_map = GameMap.new.print_map("Computer")
    input = gets.chomp.upcase

  end

end

b = Battleship.new
