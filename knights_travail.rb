require_relative "tree"

class Knight
  attr_accessor :start_pos, :move_tree

  def initialize(start_pos)
    @start_pos = start_pos
    @movements = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                  [1, 2], [-1, 2], [1, -2], [-1, -2]]
    @move_tree = Tree.new(start_pos)
  end

  def on_board?(pos)
    result = true
    pos.each { |coord| result = false unless (0..7).cover?(coord) }
    result
  end

  def move_set(pos = @start_pos)
    move_set = []
    @movements.each do |movement|
      move = [pos[0] + movement[0], pos[1] + movement[1]] # sum x & y coordinates
      move_set << move if on_board?(move)
    end
    move_set
  end

  def find_path(final)
    new_queue = [@move_tree.root]
    until (result = @move_tree.search(final))
      queue = new_queue
      new_queue = []
      queue.each do |node|
        new_queue += node.insert(move_set(node.value))
      end
    end
    print_path(trace_path(result))
  end

  def trace_path(node)
    path = [node.value]
    until node.parent == "is_root"
      node = node.parent
      path << node.value
    end
    path.reverse
  end

  def print_path(path)
    path.each do |x, y|
      print "(#{x}, #{y})\n" if path.last == [x, y]
      print "(#{x}, #{y}) -> " unless path.last == [x, y]
    end
  end
end
