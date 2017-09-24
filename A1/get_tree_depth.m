function tree_depth = get_tree_depth(tree, depth)
    
    if (isa(tree.Yes, 'double') && isa(tree.Yes, 'double')) || (tree.value <= 0)
        tree_depth = 1;
    else
        tree_depth = max(get_tree_depth(tree.Yes), get_tree_depth(tree.No)) + 1;
    end
    
end