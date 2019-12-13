class Node
  attr_accessor :data, :left, :right
end

def build_tree(arr)
  arr.sort!
  arr.uniq!

  root_index = arr.length/2

  root_node = Node.new
  root_node.data = arr[root_index]

  # normal loop
  #   - count array.length/2 times
  #   - each time, add i or sub i from the starting index, at array.length/2
  #     - eg array[ind-i] // array[ind+i] will be array[5] and array[11] on iteration 3
  #   - for even numbered arrays, take the left side of the two middle numbers as root, 
  #   - check each time if the next item will be nil array[ind-i].nil?

  current_left = Node.new
  current_right = Node.new
  root_node.left = current_left
  root_node.right = current_right

  puts arr.to_s
  (root_index).times do |i|
    puts "#{i+1} left: #{arr[root_index-(i+1)]} | #{i+1} right: #{arr[root_index+(i+1)]}"
    current_left.data = arr[root_index-(i+1)]
    current_right.data = arr[root_index+(i+1)]

    if !(arr[root_index-(i+1)].nil? || arr[root_index+(i+1)].nil?)
      p "this should run 5 times?"
      current_left.left = Node.new
      current_right.right = Node.new

      current_left = current_left.left
      current_right = current_right.right
    end
  end

  p root_node

  
end


test_arr = [1,7,4,23,8,9,4,3,5,7,9,67,6345,324]
