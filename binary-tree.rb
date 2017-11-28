class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  class Node
    attr_accessor :value, :parent, :left, :right
    def initialize(value)
      @value = value
      @parent = nil
      @left = nil
      @right = nil
    end

    def inspect
      "{#{@value}::#{@left.inspect}|#{@right.inspect}}"
    end

    def insert(value)
      if value <= @value
        @left.nil? ? @left = Node.new(value) : @left.insert(value)
      else
        @right.nil? ? @right = Node.new(value) : @right.insert(value)
      end
    end
  end

  def build_tree(array)
    @root = Node.new(array[0])
    array.each { |value| @root.insert(value) unless value.equal? array.first }
  end

  def breadth_first_search(value)
    queue = [@root]
    queue.each do |node|
      return node if node.value == value
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    nil
  end

  def depth_first_search(value)
    stack = [@root]
    until stack.empty?
      node = stack.pop
      return node if node.value == value
      stack << node.left unless node.left.nil? || node.value < value
      stack << node.right unless node.right.nil? || node.value >= value
    end
    nil
  end

  def dfs_rec(value, node = @root)
    return nil if node.nil?
    if value < node.value
      dfs_rec(value, node.left)
    elsif value > node.value
      dfs_rec(value, node.right)
    else
      return node
    end
  end
end

array = Array.new(10) { rand(100) }
@tree = BinarySearchTree.new
@tree.build_tree(array)
@tree.root.insert(88)
puts @tree.dfs_rec(88)
