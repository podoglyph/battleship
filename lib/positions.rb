class Positions
  attr_reader :letters, :numbers, :valid_coordinates

  def initialize
    @letters = ('A'..'D').to_a
    @numbers = (1..4).to_a
  end


  def combine_positions(letters, numbers)
    organize_positions(letters.zip(numbers))
  end

  def organize_positions(array)
    @valid_coordinates = array.map {|x| x.join }
  end

end
