require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class ValidateInput
  attr_reader :valid

  def initialize
    valid = false
    @valid = valid
  end

  def validate_start_up(user_input)
    valid_responses = ["p", "play", "i", "instructions", "q", "quit"]
    #binding.pry
    if valid_responses.include?(user_input)
      @valid = true
    else
      puts "Please enter a valid response."
    end
  end
end
