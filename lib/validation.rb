require 'pry'
require 'pry-state'

class Validation
  attr_reader :coordinates, :ship_size, :all_cells, :v_range

  def initialize(coordinates, ship_size)
      @coordinates = coordinates
      @ship_size = ship_size
      run
  end

  def validate_coordinate_positions?(all_cells, v_range)
    all_cells.all?{ |x| v_range.include?(x)}
  end

  private
  def build_validation_range
    @v_range = ("A".."D").to_a.concat(("1".."4").to_a)
  end

  def parse_coordinates(coordinates)
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
  end

  def create_normalized_index
    rows = ("A".."D").to_a #["A", "B", "C", "D"]
    columns = (1..4).to_a #[1, 2, 3, 4]
    j = - 1
    rows_norm = rows.map {|x| x = j += 1 } #[0, 1, 2, 3]
    columns_norm = columns.map {|x| x -= 1} #[0, 1, 2, 3]
  end

  def run
    build_validation_range
    parse_coordinates(coordinates)
    create_normalized_index
  end
  # def validate_coordinate_positions?(first_cell, second_cell)
  #   ("A".."D").to_a.include?(first_cell[0])
  #   ("A".."D").to_a.include?(second_cell[0])
  #   ("1".."4").to_a.include?(first_cell[1])
  #   ("1".."4").to_a.include?(second_cell[1])
  # end
end
