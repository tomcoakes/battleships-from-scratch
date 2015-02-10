class Board

  attr_reader :grid

  def initialize
    @grid = {A1: :w, A2: :w,
             B1: :w, B2: :w}
  end

  def number_of_cells
    grid.length
  end

  def add_to_cell(cell, obj)
    grid[cell] = obj
  end

end