class Knight
  require "binary-tree"

  def initialize(start)
    @start = start
    @movements = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                  [1, 2], [-1, 2], [1, -2], [-1, -2]]
    @move_tree = BinarySearchTree.new
  end

  def on_board?(pos)
    result = true
    pos.each { |coord| result = false unless (0..7).cover?(coord) }
    result
  end

  def move_set(pos = @start)
    move_set = @movements.map do |movement|
      move = [movement, pos].transpose.map(&:sum)
      on_board?(move) ? move : nil
    end
    move_set.delete(nil)
    move_set
  end

  def find_path
    @move_tree.build_tree(move_set)
    # TODO: Add ability to insert on a certain node
  end
end
