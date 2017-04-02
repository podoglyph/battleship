require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Battleship
  attr_reader :user_input, :valid

  def initialize
    @user_input = user_input
    valid = false
    @valid = valid
    run

  end

  def welcome_message
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    user_input = gets.chomp.downcase
    validate_input(user_input)
  end

  def validate_input(user_input)
    v = ValidateInput.new
    v.validate_start_up(user_input)
    if valid
      #start_game
      puts "Dino"
    else
      puts "Fuck all."
    end
    #here is where I'd return to.
    # come back true
    # come back false
  end

  def start_game
    puts "All your base are belong to us."
  end

  def run
    welcome_message
  end

end
b = Battleship.new
