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
  end

  def ships_remaining
    @remaining = 0
    grid.each do |y_position|
      y_position.each do |x_position|
        if x_position.is_a?(Ship)
          @remaining += 1 if !ship_sunk?(x_position)
        end
      end
    end
    @remaining
  end


# This method is just here so that I'm injecting the dependency
# rather than directly accessing a ship method within a board method
  def ship_sunk?(ship)
    ship.sunk?
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