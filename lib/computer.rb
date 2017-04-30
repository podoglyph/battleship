require './lib/ship.rb'
require './lib/validator.rb'
require './lib/ship_placer.rb'
require 'pry'

class Computer
  include Validator
  include ShipPlacer
  attr_reader :computer_grid, :two_unit_ship, :three_unit_ship, :non_occupied_cells

  def initialize
    @total_ships = 0
    @name = "Computer"
    @computer_grid = Grid.new
  end

  def get_first_position
    select_random_coordinate(computer_grid)
  end

  def get_valid_next_position
    first_position = get_first_position
    next_position = generate_next_possible(first_position, computer_grid)
    create_ship(first_position, next_position)
  end

  def create_ship(first_position, next_position)
    ship = []
    ship << first_position
    ship << next_position
    mark_ship_on_grid(ship, computer_grid)
    @two_unit_ship = ship
  end


end
