$grid = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]


def print_grid(grid)
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



def play

print_grid($grid)
  loop do
    puts "X's turn! Enter \"x y\" as your move coordinates: "
    move = gets.chomp
    move_arr = move.split(" ")
    $grid[move_arr[1].to_i][move_arr[0].to_i] = "x" 

    print_grid($grid)

    puts "O's turn! Enter \"x y\" as your move coordinates: "
    move = gets.chomp
    move_arr = move.split(" ")
    $grid[move_arr[1].to_i][move_arr[0].to_i] = "o" 

    print_grid($grid)

  end
end


play
