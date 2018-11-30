require 'byebug'
require_relative 'queue'

class PolyTreeNode
    
    attr_reader :value, :parent, :children
    def initialize(value)
        @parent = nil
        @children = []
        @value = value        
    end

    def parent=(node) 
        parent.children.delete(self) if parent 
        @parent = node  
        parent.children << self if node && !parent.children.include?(self)                
    end
        

    def add_child(child_node)
       child_node.parent = self 
    end

    def remove_child(child_node)
        raise "Node is not a child" unless self.children.include?(child_node)        
        child_node.parent = nil        
    end

    def dfs(target_value)
        if self.value == target_value
            puts "#{self.value} was target" 
            return self   
        end

        self.children.each do |child|
            child.dfs(target_value)
        end
        nil


        result = nil
        self.children.each do |child|
            result = child.dfs(target_value)
            break if result
        end
        result

        # self.children.each do |child|
        #     result = child.dfs(target_value)
        #     return result unless result.nil?
        # end
        # nil
    end

    def inspect
        self.value
    end

    def bfs(target_val)
        
        queue = Queue.new
        queue.enqueue(self)        
        until queue.peek.nil?
            node = queue.dequeue
            if node.value == target_val
                return node
            else
                node.children.each do |child|
                    queue.enqueue(child)
                end
            end
        end
        nil
    end
end

if __FILE__ == $PROGRAM_NAME
nodes =  ('a'..'g').map { |value| PolyTreeNode.new(value) } 
parent_index = 0
    nodes.each_with_index do |child, index|
      next if index.zero?
      child.parent = nodes[parent_index]
      parent_index += 1 if index.even?
    end
nodes[0].bfs("e")
end