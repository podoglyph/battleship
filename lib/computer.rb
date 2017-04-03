require './lib/grid.rb'
require 'pry'
require 'pry-state'

class Computer
  attr_reader :targeted_positions, :two_unit_ships, :three_unit_ships

  def initialize
    @grid = Grid.new
    @targeted_positions = []
    @two_unit_ships = 0
    @three_unit_ships = 0
    run
  end

  # def place_ships
  #   if two_unit_ships == 0
  #     place_two_unit_ship
  #   end
  #
  #   if two_unit_ships == 1 && three_unit_ships == 1
  #     puts "The computer has placed its ships."
  #   elsif two_unit_ships == 1 && three_unit_ships == 0
  #     place_three_unit_ship
  #   else
  #     puts "Nothing's been placed."
  #   end
  # end

  def run
    place_ships
  end

end
