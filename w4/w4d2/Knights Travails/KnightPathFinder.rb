class KnightPathFinder

     MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
    def initialize(start_pos)
        @start_pos=start_pos
        @considered_positions=[start_pos]
        build_move_tree
    end
    def find_path(end_pos)
        #find end node using dfs 
        end_node = root_node.dfs(end_pos)

        #trace it back using bfs because if it's layer by layer 
        #so its shorter path because each node has only one parent
        trace_path_back(end_node)
        .reverse
        .map(&:value)
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        queue=[self.root_node]
        until queue.empty?
            current_node = nodes.shift
            current_pos = current_node.value
            
            new_move_positions(current_node).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def self.valid_moves(pos)
        valid_moves=[]
        MOVE.each do |ele|
            new_pos= [ele[0]+pos[0],ele[1]+pos[1]]
            valid_moves << new_pos if new_pos.all? {|ele| ele.between(0,7)}
        end
        valid_moves
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos).each do |ele|
           @considered_positions << ele if !@considered_positions.include?(ele)
        end
        @considered_positions
    end

    def trace_path_back(end_node)
        nodes = []

        current_node = end_node
        until current_node.nil?
        nodes << current_node
        current_node = current_node.parent
        end

        nodes
  end
end
