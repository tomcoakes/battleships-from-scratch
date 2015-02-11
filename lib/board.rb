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
    currently_on_cell = grid[y][x]
    register_hit_or_miss(y, x, obj, currently_on_cell)
    grid[y][x] = obj
  end

private

  def register_hit_or_miss(y, x, obj, currently_on_cell)
    if obj.is_a?(Shot)
      if grid[y][x] == :w
        obj.register_miss
      else
        obj.register_hit
        currently_on_cell.hit
      end
    end
  end

end