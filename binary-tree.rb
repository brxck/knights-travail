class BinarySearchTree
  attr_reader :root
  def initialize(root = nil)
    @root = root.nil? ? nil : Node.new(root)
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

  def each
    queue = [@root]
    queue.each do |node|
      yield node
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    nil
  end

  def build_tree(array)
    if @root.nil?
      @root = Node.new(array[0])
      array.each_with_index { |value, i| @root.insert(value) }
    else
      array.each_with_index { |value, i| @root.insert(value) unless i.zero? }
    end
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
end
