class Board

  attr_reader :grid

  def initialize
    @grid = [[:w, :w],
             [:w, :w]]
  end

  def number_of_cells
    grid.flatten.count
  end

  def add_to_cell(y, x, obj)
    grid[y][x] = obj
  end

end