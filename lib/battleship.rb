require 'pry'
require 'pry-state'

class Battleship
  #attr_reader :user_input

  def initialize
    run
  end

  def welcome_message
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def get_user_input
    user_input = gets.chomp.downcase
    validate_responses(user_input) if user_input
  end

  def validate_responses(user_input)
    valid_responses = ["p", "play", "i", "instructions", "q", "quit"]

    if valid_responses.include?(user_input)
      puts "Hoorah!"
    else
      puts "Please enter a valid response."
    end

  end

  def run
    welcome_message
    get_user_input
  end

end

b = Battleship.new
#b.get_user_input
