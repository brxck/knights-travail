class Knight
  attr_reader :pos
  def initialize(pos)
    @pos = pos
    @movements = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                  [1, 2], [-1, 2], [1, -2], [-1, -2]]
  end

  def on_board?(pos)
    result = true
    pos.each { |coord| result = false unless (0..7).include?(coord) }
    result
  end

  def move_set
    move_set = @movements.map do |movement|
      move = [movement, @pos].transpose.map(&:sum)
      on_board?(move) ? move : nil
    end
    move_set.delete(nil)
    move_set
  end
end