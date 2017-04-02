require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class ValidateInput
  attr_reader :valid, :instruct

  def initialize
    valid = false
    @valid = valid
    @instruct = instruct
  end

  def validate_start_up(user_input)
    valid_responses = ["p", "play", "i", "instructions", "q", "quit"]
    if valid_responses[0..1].include?(user_input)
      @instruct = "start_game"
      @valid = true
    elsif valid_responses[2..3].include?(user_input)
      @instruct = "show_instructions"
      @valid = true
    elsif valid_responses[3..4].include?(user_input)
      @instruct = "quit_game"
      @valid = true
    else
      puts "Please enter a valid response."
    end
  end
end
