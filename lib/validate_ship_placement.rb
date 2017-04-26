module ValidateShipPlacement

  def position_ship(computer, ship_size)
    ship_position = []
    cell = computer.grid_positions[rand(0..3)].sample
    if cell.has_ship == true
      position_ship(computer, ship_size)
    end
    mark_ship(cell)
    ship_position << cell

    if ship_size == 2
      next_position = next_cell_position(cell)
      next_cell = retrieve_cell_object(computer, next_position)
      mark_ship(next_cell)
      ship_position << next_cell
    elsif ship_size == 3
      next_position = next_cell_position(cell)
      next_cell = retrieve_cell_object(computer, next_position)
      mark_ship(next_cell)
      ship_position << next_cell
      last_position = validate_third_unit(ship_position)
      last_cell = retrieve_cell_object(computer, last_position)
      mark_ship(last_cell)
      ship_position << last_cell
    end

    ship_position

  end

  private

  def next_cell_position(current_cell)
    x = current_cell.x
    y = current_cell.y
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

  def validate_third_unit(ship_position)
    cell1 = ship_position.first
    cell2 = ship_position.last

    if cell1.x == cell2.x
      if cell1.x > cell2.x
        greater = cell1
        lesser = cell2
      else
        greater = cell2
        lesser = cell1
      end
      cell3_options = [[cell1.x, greater.y + 1],[cell1.x, lesser.y - 1]]
    else
      if cell1.x > cell2.x
        greater = cell1
        lesser = cell2
      else
        greater = cell2
        lesser = cell1
      end
      cell3_options = [[greater.x + 1, cell1.y],[lesser.x - 1, cell1.y]]
    end
    generate_valid_third_unit_positions(cell3_options)
  end

  def generate_valid_third_unit_positions(options)
    possible = options
    valid = possible.reject do |i|
      i.any? {|j| j < 0 || j > 3 }
    end
    choose_next_position(valid)
  end

  def retrieve_cell_object(computer, valid_position)
    grid = computer.grid_positions.flatten
    grid.find do |cell|
      cell.x == valid_position.first && cell.y == valid_position.last
    end
  end

  def mark_ship(cell)
    cell = cell.has_ship = true
  end
end
