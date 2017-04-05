require 'pry'
require 'pry-state'

class ValidateOnMap

  def initialize(coordinates, ship_size)
    @coordinates = coordinates
    @ship_size = ship_size
  end

  def self.validate_coordinate_positions?(all_cells, v_range)
    return true if all_cells.all?{ |x| v_range.include?(x)}
    false
  end

  def self.parse_coordinates(coordinates, ship_size, indices = false)
    if ship_size == 2
      first_cell, second_cell = [], []
      first_cell = coordinates[0..1].chars #["A", "1"]
      second_cell = coordinates[-2..-1].chars #["B", "1"]
      all_cells = first_cell.concat(second_cell)
      if indices == true
        return all_cells.each_slice(2).to_a
      end
    end
    if ship_size == 3
      first_cell, second_cell, third_cell = [], [], []
      first_cell = coordinates[0..1].chars #["A", "1"]
      second_cell = coordinates[3..4].chars #["B", "1"]
      third_cell = coordinates[-2..-1].chars
      all_cells = first_cell.concat(second_cell).concat(third_cell)
      if indices == true
        return all_cells.each_slice(2).to_a
      end
    end
    build_validation_range(all_cells)
  end

  def self.build_validation_range(all_cells)
    v_range = ("A".."D").to_a.concat(("1".."4").to_a)
    validate_coordinate_positions?(all_cells, v_range)
  end
end
