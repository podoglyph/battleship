module ValidateShipPlacement

  def position_ship(computer, ship_size)
    ship_position = []
    cell = computer.grid_positions[rand(0..3)].sample
    ship_position << cell
    if cell.has_ship == false
      next_position = next_cell_position(cell, ship_size)
      next_cell = retrieve_cell_object(computer, next_position)
      return ship_position << next_cell
    else
      first_position(computer)
    end
  end

  def next_cell_position(cell, ship_size)
    next_cell = determine_valid_positions(cell)
  end

  private
  def determine_valid_positions(cell)
    extract_cell_coordinates(cell)
  end

  def extract_cell_coordinates(cell)
    x = cell.x
    y = cell.y
    generate_valid_positions(x,y)
  end

  def generate_valid_positions(x, y)
    possible = [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]]
    valid = possible.reject do |i|
      i.any? {|j| j < 0 || j > 3 }
    end
    choose_next_position(valid)
  end

  def choose_next_position(valid)
    valid.sample
  end

  def retrieve_cell_object(computer, valid_position)
    grid = computer.grid_positions
    grid.each do |array|
      array.find do |cell|
        cell.x == valid_position.first && cell.y == valid_position.last
      end
    end
  end

end
