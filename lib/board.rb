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
    register_hit_or_miss(y, x, obj, currently_on_cell) if obj.is_a?(Shot)
    grid[y][x] = obj
    ships_placed << obj if !obj.is_a?(Shot)
  end

  def ships_placed
    @ships_placed ||= []
  end

  def ships_remaining
    1
  end

  # Could I use inject (but in reverse)?

  def check_ship_status(ship)
    if ship.sunk? == true
      return "sunk"
    else
      return "floating"
    end
  end

private

  def register_hit_or_miss(y, x, obj, currently_on_cell)
      if grid[y][x] == :w
        obj.register_miss
      else
        obj.register_hit
        currently_on_cell.hit
      end
  end

end