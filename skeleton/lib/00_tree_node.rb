require "byebug"

class PolyTreeNode


    def initialize(value, children = [])
        @value = value
        @parent = nil
        @children = children 
    end

    def parent
        @parent 
    end
    
    def parent= (new_parent)

        if @parent == nil
            @parent = new_parent
            @parent.children.push(self)
        else
            @parent.children.select!{|child| self != child}

            if new_parent == nil
                @parent = new_parent
            else
                @parent = new_parent
                @parent.children.push(self)
            end
        end


        # if parent != nil 
        # #    @parent.remove_child(self)
        # end
        # if par != nil
        #     @parent = par 
        #     par.children.concat([self])
        # end
    end

    def children 
        children 
    end 

    def add_child(node)
        node.parent = (self)
    end

    def remove_child(node)
        node.parent = nil
    end 

    def value
        value 
    end 

    def dfs(target_value)
        debugger
        if self.value == target_value
            return self 
        else
            self.children.each do |child|
                #lmnop = self.parent.children.find_index(self)
                return child.dfs(target_value)
            end
        end
        nil
    end

    attr_accessor :value, :children

end

p n1 = PolyTreeNode.new("root1")
p n2 = PolyTreeNode.new("root2")
p n3 = PolyTreeNode.new("root3")
# p goodboy = PolyTreeNode.new("goodboy the dog")

# connect n3 to n1
n3.parent = (n1)
# connect n3 to n2
n3.parent = (n2)

# # this should work
raise "Bad parent=!" unless n3.parent == n2
raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
raise "Bad parent=!" unless n1.children == []

# goodboy.add_child(n1)
# goodboy.add_child(n2)
# goodboy.add_child(n3)

# p goodboy

