require 'board'

describe Board do
  let(:board) {Board.new}
  let(:ship) {double :ship, sunk?: false}
  let(:destroyed_ship) {double :destroyed_ship, sunk?: true}
  let(:shot) {double :shot, is_a?: :Shot}

  it "has a grid" do
    expect(board).to respond_to(:grid)
  end

  it "has a 2x2 grid" do
    expect(board.number_of_cells).to eq(4)
  end

  it "contains only water to begin with" do
    expect(board.grid).to eq([[:w,:w],[:w,:w]])
  end

  it "can add other objects to its cells" do
    board.add_to_cell(1, 0, ship)
    expect(board.grid).to eq([[:w,:w],[ship,:w]])
  end

  it "tells a shot that it was a miss when placed in water" do
    expect(shot).to receive(:register_miss) 
    board.add_to_cell(0, 0, shot)
  end

  it "tells a shot that it was a hit when placed on a ship" do
    board.add_to_cell(1, 0, ship)
    expect(shot).to receive(:register_hit)
    expect(ship).to receive(:hit)
    board.add_to_cell(1, 0, shot)
  end

  it "tells a ship that it was hit" do
    board.add_to_cell(0, 0, ship)
    expect(shot).to receive(:register_hit)
    expect(ship).to receive(:hit)
    board.add_to_cell(0, 0, shot)
  end

  it "knows how many ships remain on the board" do
    allow(ship).to receive(:is_a?).and_return(false)
    board.add_to_cell(0, 0, ship)
    allow(ship).to receive(:is_a?).and_return(true)
    expect(board.ships_remaining).to eq(1)
  end

  it "can check that a sunk ship has been sank" do
    expect(destroyed_ship).to be_sunk
  end

  it "can check that a floating ship is still floating" do
    expect(ship).not_to be_sunk
  end

  # it "updates the number of remaining ships when a ship is destroyed" do
  #   board.add_to_cell(0, 0, ship)
  #   expect(shot).to receive(:register_hit)
  #   expect(ship).to receive(:hit)
  #   board.add_to_cell(0, 0, shot)
  #   expect(board.ships_remaining).to eq(0)
  # end

end