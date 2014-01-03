# Update tree class from book to allow specifying tree with nested hashes
class Tree
  attr_accessor :children, :node_name
  
  def initialize(nodes)
    nodes.each_pair do |key, value| 
      @node_name = key
      @children = []
      value.each_pair {|childKey, childValue| @children.push(Tree.new({childKey => childValue}))}
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

# Test with original tree
ruby_tree = Tree.new({'Ruby' => {'Reia' => {}, 'MacRuby' => {}}})
puts "visiting entire original tree"
ruby_tree.visit_all {|node| puts node.node_name}
  
# Test with task 2 tree
task2_tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
puts "visiting entire task 2 tree"
task2_tree.visit_all {|node| puts node.node_name}