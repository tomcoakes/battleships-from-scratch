class Game

  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

end