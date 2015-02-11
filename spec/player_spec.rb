require 'player'

describe Player do
  
  let(:board) {double :board}
  let(:ship) {double :ship}
  let(:shot) {double :shot}
  let(:player) {Player.new}

  it "can place ships onto a board" do
    expect(board).to receive(:add_to_cell).with(0, 0, ship)
    player.place_ship(0, 0, ship, board)
  end

  it "can take shots at a board" do
    expect(board).to receive(:add_to_cell).with(0, 0, shot)
    player.take_shot(0, 0, shot, board)
  end

  it "returns 'You missed!' when a shot misses" do
    expect(board).to receive(:add_to_cell).with(0, 0, shot).and_return("You missed!")
    expect(player.take_shot(0, 0, shot, board)).to eq("You missed!")
  end

  it "returns 'You hit a ship!' when a shot misses" do
    expect(board).to receive(:add_to_cell).with(0, 0, ship)
    player.place_ship(0, 0, ship, board)
    expect(board).to receive(:add_to_cell).with(0, 0, shot).and_return("You hit a ship!")
    expect(player.take_shot(0, 0, shot, board)).to eq("You hit a ship!")
  end

end