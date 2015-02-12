require 'player'

describe Player do
  
  let(:board) {double :board}
  let(:ship) {double :ship}
  let(:shot) {double :shot}
  let(:player) {Player.new}

  it "creates its own board" do
    expect(player.board.grid).to eq([[:w, :w],
                                     [:w, :w]])
  end

  it "can place ships onto a board" do
    expect(player.board).to receive(:add_to_cell).with(0, 0, ship)
    player.place_ship(0, 0, ship)
  end

  it "can take shots at a board" do
    expect(board).to receive(:add_to_cell).with(0, 0, shot)
    player.take_shot(0, 0, shot, board)
  end

end