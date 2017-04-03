class Messages

  def self.welcome
    "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def self.instructions
    puts "To play the game...do all this stuff.\n Press ENTER to continue."
    enter = gets.chomp
    return if enter.empty?
  end

  def self.quit_game
    puts "Goodbye."
    print "."
    sleep(0.4)
    print "..."
    sleep(0.4)
    print "....."
    sleep(0.4)
    print "exit"
    sleep(0.2)
    exit
  end
end
