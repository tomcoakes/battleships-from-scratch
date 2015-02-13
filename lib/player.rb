class Player

  attr_reader :board

  def initialize(with_ships)
    @board = Board.new
    @ships = with_ships
  end

  def ships
    @ships ||= []
  end

  def place_ship(y, x, ship)
    #if check_ship_availability(ship)
      board.add_to_cell(y, x, ship)
    #end

  end

  def take_shot(y, x, shot, board)
    board.add_to_cell(y, x, shot)
  end

  def check_ship_availability(ship)
    return true if ships.include?(ship)
  end

end