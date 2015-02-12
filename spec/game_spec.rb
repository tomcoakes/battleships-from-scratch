require 'game'

describe Game do

  it "creates two players when the game is initialized" do
    battleships = Game.new
    expect(battleships.player1).to respond_to(:place_ship)
    expect(battleships.player2).to respond_to(:place_ship)
  end

  it "can shoot an opponent's board" do
    battleships = Game.new
    shot = Shot.new
    expect(battleships.player2.board).to receive(:add_to_cell)
    battleships.player_shoots(battleships.player1, 0, 0, shot)
  end
end