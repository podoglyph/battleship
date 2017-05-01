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
    check_if_occupied(next_valid, index, grid, position, choice)
  end

  def check_if_occupied(next_valid, index, grid, position, choice)
    grid.game_grid.each do |cell|
      if cell.location == choice && cell.has_ship
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

  def order_partial_ship_positions(first_position, next_position)
    partial_ship = []
    if first_position < next_position
      partial_ship << first_position
      partial_ship << next_position
    else
      partial_ship << next_position
      partial_ship << first_position
    end
    partial_ship
  end

  def select_valid_third_position(ordered_positions, grid)
    direction = check_direction(ordered_positions)
    third_position = check_edge(direction, ordered_positions, grid)
  end

  def check_direction(positions)
    if positions[0][0] == positions[1][0]
      "horizontal"
    else
      "vertical"
    end
  end

  def check_edge(direction, ordered_positions, grid)
    if direction == "horizontal"
      if ordered_positions[0][1] == 1
        ordered_positions[0][0] + "3"
      elsif ordered_positions[1][1] == 4
        ordered_positions[0][0] + "2"
      else
        choose_an_edge(direction, ordered_positions, grid)
      end
    elsif direction == "vertical"
      if ordered_positions[0][0] == "A"
        "C" + ordered_positions[0][1]
      elsif ordered_positions[1][0] == "D"
        "B" + ordered_positions[0][1]
      else
        choose_an_edge(direction, ordered_positions, grid)
      end
    end
  end

  def choose_an_edge(direction, ordered_positions, grid)
    index_choices = []
    index_choices << grid.locations.find_index {|position| position == ordered_positions[0]} - 1

    index_choices << grid.locations.find_index {|position| position == ordered_positions[1]} + 1

    not_occupied = remove_occupied(grid)
    verify_unoccupied(index_choices, not_occupied, grid)
  end

  def verify_unoccupied(index_choices, not_occupied, grid)
    index_choices.map! {|index| index = grid.locations[index]}
    choices = index_choices.keep_if { |choice| not_occupied.include?(choice)}
    choices.sample
  end

  def verify_coordinates(input)
    if input.all? { |i| grid.locations.include?(i) } == false
      invalid_ship_not_on_map_message
    else
      true
    end
  end

end
