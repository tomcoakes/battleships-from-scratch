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
    send_feedback = register_hit_or_miss(y, x, obj, currently_on_cell) if obj.is_a?(Shot)
    grid[y][x] = obj
    send_feedback
  end

  def ships_remaining
    @ships_remaining = 0
    grid.each do |y_position|
      y_position.each do |x_position|
        if x_position.is_a?(Ship)
          @ships_remaining += 1 if !ship_sunk?(x_position)
        end
      end
    end
    @ships_remaining
  end


# This method is just here so that I'm injecting the dependency
# rather than directly accessing a ship method within a board method
  def ship_sunk?(ship)
    ship.sunk?
  end


  def register_hit_or_miss(y, x, obj, currently_on_cell)
      if grid[y][x] == :w
        send_feedback = obj.register_miss
      else
        send_feedback = obj.register_hit
        currently_on_cell.hit
        send_feedback
      end
  end

end