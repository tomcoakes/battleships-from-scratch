require 'board'

describe Board do
  let(:board) {Board.new}
  let(:ship) {double :ship}
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

  # it "can check what is currently in a cell before placement" do
  #   board.add_to_cell
  # end

  it "tells a shot that it was a miss when placed in water" do
    expect(shot).to receive(:register_miss) 
    board.add_to_cell(0, 0, shot)
  end

  it "tells a shot that it was a hit when placed on a ship" do
    board.add_to_cell(1, 0, ship)
    expect(shot).to receive(:register_hit)
    board.add_to_cell(1, 0, shot)
  end

end