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
    board.add_to_cell(y, x, ship)
  end

  def take_shot(y, x, shot, board)
    board.add_to_cell(y, x, shot)
  end

end