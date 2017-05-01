module Messages

  def welcome_message
    puts "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def instructions_message
    puts "To play the game...do all this stuff.\n Press ENTER to continue."
    enter = gets.chomp
    return if enter.empty?
  end

  def quit_game_message
    puts "Goodbye."
    print "."
    sleep(0.4)
    print "..."
    sleep(0.4)
    print "....."
    sleep(0.4)
    print "Exit"
    sleep(0.2)
    exit
  end

  def place_ship_on_map_message
    puts "Invalid ship placement. You must place your ship within grid boundaries.\n Press ENTER to continue."
    enter = gets.chomp
    return if enter.empty?
  end

  def invalid_response_message
    puts "Please enter a valid response."
  end

  def start_game_message
    puts "Please wait while the computer chooses its positions."
  end

  def place_your_ships_message
    puts "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:"
  end

  def place_your_second_ship_message
    puts "Enter the squares for the three-unit ship:"
  end

  def invalid_ship_not_on_map_message
    puts "Those coordinates aren't on the map. Please choose again."
  end

  def shoot_message
    puts "Enter one position to fire upon."
  end

end
