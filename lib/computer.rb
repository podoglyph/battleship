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

  def place_ship(ship_size)
    get_first_position(ship_size)
  end

  def get_first_position(ship_size)
    first_position = select_random_coordinate(computer_grid)
    get_valid_next_position(first_position, ship_size)
  end

  def get_valid_next_position(first_position, ship_size)
    next_position = generate_next_possible(first_position, computer_grid)
    if ship_size == 2
      create_ship(first_position, next_position)
    else
      ordered_positions = order_partial_ship_positions(first_position, next_position)
      third_position = select_valid_third_position(ordered_positions, computer_grid)
      create_ship(first_position, next_position, third_position)
    end
  end

  def create_ship(first_position, next_position, third_position = nil)
    ship = []
    ship << first_position
    ship << next_position
    if third_position
      ship << third_position
      mark_ship_on_grid(ship, computer_grid)
      @three_unit_ship = ship
      return three_unit_ship
    end
    mark_ship_on_grid(ship, computer_grid)
    @two_unit_ship = ship
  end

end
