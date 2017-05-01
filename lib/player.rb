require './lib/required_files.rb'
require 'pry'

class Player
  include Messages
  include Validator
  include ShipPlacer

  attr_reader :grid, :two_unit_ship, :three_unit_ship

  def initialize
    @total_ships = 0
    @name = "Player 1"
    @grid = Grid.new
  end

  def place_ships(input, ship_size)
    if ship_size == 2
      mark_ship_on_grid(input, grid)
      @two_unit_ship = input
    elsif ship_size == 3
      mark_ship_on_grid(input, grid)
      @three_unit_ship = input
    end
  end


end
