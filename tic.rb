def print_grid(grid)				# Method to print the grid
  grid.each_with_index do |y, yindex|

    y.each_with_index do |x, xindex|

      unless xindex == y.length-1 
			
      print " #{x} |"	
      else print " #{x} \n"
			
      end
		
    end

    unless yindex == y.length-1
	
      print "---|---|---\n"
      else puts 
    end	
  end

end						# End of print_grid

def check_full(grid, full=true)			# Method to check if the grid is full

grid.each do |x, y, z|

  if x == " " || y == " " || z == " "
    full = false
    break
  end
end


return full
end						# End of check_full

def check_winner(grid)        			# Method to determine if there is a winner

# winner returns "x", "o" or "n" (no winner) 
winner = "n" 

# check horizontal
grid.each do |x,y,z|
  if (x==y && y==z) && x != " "
    winner = x
    return winner.capitalize
  end
end

# check vertical
(0..2).each do |i|
  if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i]
    winner = grid[0][i]
    return winner.capitalize
  end

end
# check diagonal
if (grid[0][0]==grid[1][1] && grid[1][1] == grid[2][2])
  winner = grid[0][0]
  return winner.capitalize
elsif (grid[0][2]==grid[1][1] && grid[1][1]==grid[2][0])
  winner = grid[0][2]
  return winner.capitalize

end
return winner.capitalize

end						# End of check_winner



def play					# Method to play the game


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

turn = "X"
  loop do
    puts "#{turn}'s turn! Enter an integer 1-9 for your move: "
      loop do
    move = gets.chomp
    if move.to_i > 9 || move.to_i < 1 
	puts "Can you read? Enter an integer 1-9: "
	next
    end
    move_arr = assign[move.to_i].split(" ")
    if grid[move_arr[1].to_i][move_arr[0].to_i] != " " 
	puts "That square is already taken! Try again: "
	next
     end
    grid[move_arr[1].to_i][move_arr[0].to_i] = turn.downcase 
	break
      end
    print_grid(grid)
    if check_winner(grid) == "X"
      puts "#{check_winner(grid)} wins!"
      break
    elsif check_winner(grid) =="O"
      puts "#{check_winner(grid)} wins!"
      break
    end

    if turn == "X"
      turn = "O"
    else
      turn = "X"
    end

    if check_full(grid) 
      puts "Congratulations! Everyone's a winner!"
      break
    end

 end
end						# End of play


play
