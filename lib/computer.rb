require './lib/ship.rb'
require './lib/validator.rb'
require 'pry'

class Computer
  include Validator
  attr_reader :computer_grid, :two_unit_ship, :three_unit_ship, :non_occupied_cells

  def initialize
    @total_ships = 0
    @name = "Computer"
    @computer_grid = Grid.new
  end

  def get_first_position
    @non_occupied_cells = remove_occupied_positions(computer_grid)
    select_random_coordinate(non_occupied_cells)
  end

  def get_valid_next_position
    first_position = get_first_position
    next_position = generate_next_possible(first_position, non_occupied_cells)
    create_ship(first_position, next_position)
  end

  def create_ship(first_position, next_position)
    ship = []
    ship << first_position
    ship << next_position
    @two_unit_ship = ship
  end


end
