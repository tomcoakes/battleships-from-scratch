require 'game'

describe Game do

  let(:battleships) {Game.new}
  let(:shot) {double :shot}

  it "creates two players when the game is initialized" do
    expect(battleships.player1).to respond_to(:place_ship)
    expect(battleships.player2).to respond_to(:place_ship)
  end

  it "can pass a player's shot to the opponent's board" do
    expect(battleships.player2.board).to receive(:add_to_cell)
    battleships.player_shoots(battleships.player1, 0, 0, shot)
  end

  it "declares player 1 as the winner when player 2's ships are all sunk" do
    battleships.player2.place_ship(0, 0, Ship.dinghy)
    battleships.player_shoots(battleships.player1, 0, 0, Shot.new)
    expect(battleships.check_if_winner(battleships.player1)).to eq("That was a hit, you've won!")
  end

  it "declares player 2 as the winner when player 1's ships are all sunk" do
    battleships.player1.place_ship(0, 0, Ship.dinghy)
    battleships.player_shoots(battleships.player2, 0, 0, Shot.new)
    expect(battleships.check_if_winner(battleships.player2)).to eq("That was a hit, you've won!")
  end
end