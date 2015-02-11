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
    register_hit_or_miss(y, x, obj)
    grid[y][x] = obj
  end

  def register_hit_or_miss(y, x, obj)
    if obj.is_a?(Shot)
      grid[y][x] == :w ? obj.register_miss : obj.register_hit
    end
  end

end