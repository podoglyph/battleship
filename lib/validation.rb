require 'pry'
require 'pry-state'

module Validation

  def self.validate_coordinate_positions?(all_cells, v_range)
    true if all_cells.all?{ |x| v_range.include?(x)}
  end

  def self.parse_coordinates(coordinates, ship_size)
    if ship_size == 2
      first_cell, second_cell = [], []
      first_cell = coordinates[0..1].chars #["A", "1"]
      second_cell = coordinates[-2..-1].chars #["B", "1"]
      @all_cells = first_cell.concat(second_cell)
    end
    if ship_size == 3
      first_cell, second_cell, third_cell = [], [], []
      first_cell = coordinates[0..1].chars #["A", "1"]
      second_cell = coordinates[3..4].chars #["B", "1"]
      third_cell = coordinates[-2..-1].chars
      @all_cells = first_cell.concat(second_cell).concat(third_cell)
    end
    build_validation_range
  end

  def self.build_validation_range
    @v_range = ("A".."D").to_a.concat(("1".."4").to_a)
    validate_coordinate_positions?(@all_cells, @v_range)
  end
end
