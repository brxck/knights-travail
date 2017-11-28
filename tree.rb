class Tree
  attr_reader :root
  def initialize(root)
    @root = Node.new(root, :root)
  end

  class Node
    attr_accessor :value, :parent, :children
    def initialize(value, parent)
      @value = value
      @parent = parent
      @children = []
    end

    def insert(array)
      array.each { |item| @children << Node.new(item, self) }
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

  def build_tree(array)
    array.each { |value| @root.insert(value) }
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
