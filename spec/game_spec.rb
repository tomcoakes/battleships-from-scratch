require 'game'

describe Game do

  it "creates two players when the game is initialized" do
    battleships = Game.new
    expect(battleships.player1).to respond_to(:place_ship)
    expect(battleships.player2).to respond_to(:place_ship)
  end
end