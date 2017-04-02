require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class ValidateInput
  attr_reader :valid

  def initialize
    valid = false
    @valid = valid
    #b = Battleship
    #@b = b
  end

  def validate_start_up(user_input)
    valid_responses = ["p", "play", "i", "instructions", "q", "quit"]
    binding.pry
    if valid_responses.include?(user_input)
      puts "Hoorah!"
      @valid = true
    else
      puts "Please enter a valid response."
      valid = false
      puts "Where are you goin?"
    end

  end

end
