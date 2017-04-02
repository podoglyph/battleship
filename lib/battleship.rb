require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Battleship
  attr_reader :user_input

  def initialize
    user_input = nil
    @user_input = user_input
    run
  end

  def welcome_message
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    @user_input = gets.chomp.downcase
    validate_input(user_input)
  end

  def validate_input(user_input)
    v = ValidateInput.new
    v.validate_start_up(user_input)

    if v.instruct == "start_game"
      start_game
    elsif v.instruct == "show_instructions"
      show_instructions
    elsif v.instruct == "quit_game"
      quit_game
    else
      welcome_message
    end

  end

  def start_game
    puts "All your base are belong to us."
  end

  def show_instructions
    puts "To play the game...do all this stuff."
    return welcome_message
  end

  def quit_game
    exit
  end

  def run
    welcome_message
  end

end

b = Battleship.new
