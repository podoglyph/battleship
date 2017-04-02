require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Battleship
  attr_reader :user_input

  def initialize
    @user_input = user_input
    run
  end

  def welcome_message
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    user_input = gets.chomp.downcase
    validate_input(user_input)
  end

  def validate_input(user_input)
    if not defined? v
      v = ValidateInput.new
      v.validate_start_up(user_input)
    end

    if v.valid
      start_game
    else
      user_input = nil
      v = nil
      welcome_message
    end

  end

  def start_game
    puts "All your base are belong to us."
  end

  def run
    welcome_message
  end

end

b = Battleship.new
