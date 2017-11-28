class Tree
  include Enumerable

  attr_reader :root
  def initialize(root)
    @root = Node.new(root, "is_root")
  end

  class Node
    attr_accessor :value, :parent, :children
    def initialize(value, parent)
      @value = value
      @parent = parent
      @children = []
    end

    def insert(array)
      node_list = []
      array.each do |x, y|
        node = Node.new([x, y], self)
        @children << node
        node_list << node
      end
      node_list
    end
  end

  def each
    queue = [@root]
    queue.each do |node|
      yield node
      node.children.each { |child| queue << child }
    end
    nil
  end

  def search(value)
    queue = [@root]
    queue.each do |node|
      return node if node.value == value
      node.children.each { |child| queue << child }
    end
    nil
  end
end
