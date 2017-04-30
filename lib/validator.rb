module Validator

  def select_random_coordinate(grid)
    not_occupied = remove_occupied(grid)
    not_occupied.sample
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
    choice = grid.locations[index + position]
    check_if_occupied(next_valid, index, grid, choice, position)
  end

  def check_if_occupied(next_valid, index, grid, choice, position)
    grid.game_grid.each do |cell|
      if cell.location == position && cell.has_ship
        next_valid.delete(position)
        choose_next_position(next_valid, index, grid)
      end
    end
    choice
  end

  def remove_occupied(grid)
    not_occupied = []
    grid.game_grid.each do |cell|
      if cell.has_ship == false
        not_occupied << cell.location
      end
    end
    not_occupied
  end

end
