require './lib/messages.rb'

module ValidateShipPlacement
  include Messages

  def computer_first_cell(computer, ship_size)
    ship_position = []
    cell = computer.grid_positions[rand(0..3)].sample
    if check_cell_is_unoccupied(computer, ship_size, cell) == false
      computer_first_cell(computer, ship_size)
    else
      mark_ship(cell)
      ship_position << cell
      second_cell(computer, ship_size, cell, ship_position)
    end
  end

  def player_first_cell(player, location, ship_size)
    location = location.split(" ")
    coordinates = parse_location(location)
  end

  def parse_location(location)
    
  end

  def second_cell(current_player, ship_size, cell, ship_position)
    valid_positions = next_cell_position(cell)
    next_position = remove_occupied_cells(current_player, valid_positions)
    next_cell = retrieve_cell_object(current_player, ship_size, next_position)
    mark_ship(next_cell)
    ship_position << next_cell
    if ship_size > 2 && ship_position.length < 3
      third_cell(current_player, ship_size, ship_position)
    end
    ship_position
  end

  def third_cell(current_player, ship_size, ship_position)
    valid_positions = validate_third_unit(ship_position)
    third_position = remove_occupied_cells(current_player, valid_positions)
    third_unit_cell = retrieve_cell_object(current_player, ship_size, third_position)

    if check_cell_is_unoccupied(current_player, ship_size, third_unit_cell) == false
      third_cell(current_player, ship_size, ship_position)
    else
      third_unit_cell = check_cell_is_unoccupied(current_player, ship_size, third_unit_cell)
      mark_ship(third_unit_cell)
    end

    ship_position << third_unit_cell
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
    valid
  end

  def remove_occupied_cells(current_player, valid_positions)
    grid = current_player.grid_positions.flatten
    valid_positions.delete_if do |coordinate|
      grid.find do |cell|
        if cell.x == coordinate.first && cell.y == coordinate.last && cell.has_ship == true
        end
      end
    end
    choose_next_position(valid_positions)
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
    valid
  end

  def retrieve_cell_object(current_player, ship_size, valid_position)

    grid = current_player.grid_positions.flatten
    next_cell = grid.find do |cell|
      cell.x == valid_position.first && cell.y == valid_position.last
    end
    next_cell
  end

  def check_cell_is_unoccupied(current_player, ship_size, cell)
    if cell.has_ship && current_player.class == Computer
      false
    else
      cell
    end
  end

  def mark_ship(cell)
    cell.has_ship = true
  end

end
