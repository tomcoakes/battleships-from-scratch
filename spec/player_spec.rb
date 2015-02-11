require 'player'

describe Player do
  
  let(:board) {double :board}
  let(:ship) {double :ship}

  it "can place ships onto the board" do
    player = Player.new
    expect(board).to receive(:add_to_cell).with(0, 1, ship)
    player.place_ship(0, 1, ship, board)
  end

end