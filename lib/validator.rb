module Validator

  def select_random_coordinate(grid)
    grid.locations.sample
  end

  def generate_next_possible(first_position, grid)
    check_indices(first_position, grid)
  end

  def check_indices(first_position, grid)
    valid_index_1 = check_index_1(first_position)
    next_valid = check_index_2(first_position, valid_index_1)
    index = get_first_position_index(first_position, grid)
    choose_next_position(next_valid, index, grid)
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

  def get_first_position_index(first_position, grid)
    grid.game_grid.find_index {|cell| cell.location == first_position}
  end

  def choose_next_position(next_valid, index, grid)
    position = next_valid.sample
    grid.locations[index + position]
  end

end
