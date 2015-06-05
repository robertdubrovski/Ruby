def print_grid(grid)				# Method to print the grid
  grid.each_with_index do |y, index|

    y.each_with_index do |x, index|

      unless index == y.length-1 
			
      print " #{x} |"	
      else print " #{x} \n"
			
      end
		
    end

    unless index == y.length-1
	
      print "---|---|---\n"
      else puts 
    end	
  end

end

def check_full(grid, full=true)			# Method to check if the grid is full

grid.each do |x, y, z|

  if x == " " || y == " " || z == " "
    full = false
    break
  end
end


return full
end

def play


help_grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
grid = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

puts "This is how the grid numbers are assigned:"
print_grid(help_grid)

assign = {

  1 => "0 0",
  2 => "1 0",
  3 => "2 0",
  4 => "0 1",
  5 => "1 1",
  6 => "2 1",
  7 => "0 2",
  8 => "1 2",
  9 => "2 2",
}

  loop do
    puts "X's turn! Enter an integer 1-9 for your move: "
      loop do
    move = gets.chomp
    move_arr = assign[move.to_i].split(" ")
    if grid[move_arr[1].to_i][move_arr[0].to_i] != " " 
	puts "You can't move there you goddamn snake! Try again: "
	next
     end
    grid[move_arr[1].to_i][move_arr[0].to_i] = "x" 
	break
      end
    print_grid(grid)

    break if check_full(grid)

    puts "O's turn! Enter an integer 1-9 for your move: "
          loop do
    move = gets.chomp
    move_arr = assign[move.to_i].split(" ")
    if grid[move_arr[1].to_i][move_arr[0].to_i] != " " 
	puts "You can't move there you goddamn snake! Try again: "
	next
     end
    grid[move_arr[1].to_i][move_arr[0].to_i] = "o" 
	break
      end
    print_grid(grid)

  end
puts "Congratulations! Everyone's a winner!"
end


play
