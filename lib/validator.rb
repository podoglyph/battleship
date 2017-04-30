module Validator

  def select_random_coordinate(non_occupied_cells)
    non_occupied_cells.sample
  end

  def remove_occupied_positions(grid)
    grid.game_grid.map
  end

  def generate_next_possible(first_position, non_occupied_cells)
    check_indices(first_position, non_occupied_cells)
  end

  def check_indices(first_position, non_occupied_cells)
    valid_index_1 = check_index_1(first_position)
    next_valid = check_index_2(first_position, valid_index_1)
    index = get_first_position_index(first_position, non_occupied_cells)
    choose_next_position(next_valid, index, non_occupied_cells)
  end

  def check_index_1(first_position)
    next_valid = []
    if first_position[1] == "1"
      next_valid = [1, -4, 4]
    elsif first_position[1] == "4"
      next_valid = [-1, -4, 4]
    elsif first_position[1] == "2" or "3"
      next_valid = [-1, 1, -4, 4]
    end
    next_valid
  end

  def check_index_2(first_position, next_valid)
    if first_position[0] == "A"
      next_valid.delete(-4)
    elsif first_position[0] == "D"
      next_valid.delete(4)
    else
      next_valid
    end
    next_valid
  end

  def get_first_position_index(first_position, non_occupied_cells)
    non_occupied_cells.index(first_position)
  end

  def choose_next_position(next_valid, index, non_occupied_cells)
    position = next_valid.sample
    non_occupied_cells[index + position]
  end

end
