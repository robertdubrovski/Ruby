# Sudoku Solver


class Sudoku

# A grid is a two dimensional array. Each square contains a string with
# the correct integer (e.g. "5") or with the string of possibilities 
# (e.g. "34568").  

  attr_reader :grid
  def initialize(grid)
    @grid = grid
  end # end of initialize

  def setup(grid)
  
    grid.each do |y|

      y.map! do |x|

	if x == " "
	  "123456789"
        else x
	end
      end
    end
  end # end of setup

  def self.check_full(grid, full=true)

    grid.each do |y|

      y.each do |x|

        if x.length > 1
          full = false
          break
        end
      end
      
      if full == false
        break
      end
    end
    return full
  end # end of check_full


  def self.print_grid(grid)
  
    grid.each_with_index do |y, yindex|

      y.each_with_index do |x, xindex|

       unless xindex == y.length-1

       print " #{x} "
       
	 if xindex == 2 || xindex == 5
	   print " | "
	 end
       else puts " #{x} "
       end
      end
      
	if yindex == 2 || yindex == 5
	  print "--------- | --------- | ---------\n"
	elsif yindex == 8
	  puts 
        end
    end


  end # end print_grid
  

  def solve(grid)
count = 1
  loop do
if count == 30 
break
end

    grid.each_with_index do |y, i|
    
      rnums = [] # Array to eventually filter for only single values in rows
      cnums = [] # Array to eventually filter for only single values in columns

      y.each_with_index do |x, j|
        cnums = []
        if x.length == 1              # If square is solved, go to next square
          next
        end

# Check row

        y.each_with_index do |z, k|
          if k == j && z.length == 1
	    rnums = rnums + z.split(//)
            next
          end
       
          if z.length == 1
            y[j].tr!(z,'') 
	    rnums = rnums + z.split(//)
          else rnums = rnums + z.split(//)
          end 
        
        end
        
        singles = rnums.select{|s| rnums.count(s) == 1} # The values that appear once in the row

        y.each_with_index do |z, k|

	  if singles.length == 0
	    break
	  elsif z.length == 1
	    next
	  end

          singles.each do |sin|

            if z.include? sin
              y[k] = sin
              #singles.delete(sin)
            end

          end # end of singles.each


        end # y.each_with_index do |z, k|

# Check column
# The outermost loop is grid.each_with_index do |y, i|

        grid.each_with_index do |z, k|
          if k == i && z[j].length == 1
	    cnums = cnums + z[j].split(//)
            next
	  end

	  if z[j].length == 1
	    y[j].tr!(z[j],'') 
	    cnums = cnums + z[j].split(//)
            next
          else cnums = cnums + z[j].split(//)
	  end

        end # grid.each_with_index do |z, k|


        singles = cnums.select{|s| cnums.count(s) == 1} # The values that appear once in the column 
 
        grid.each_with_index do |z, k|

	  if singles.length == 0
	    break
	  elsif z[j].length == 1
	    next
	  end

          singles.each do |sin|

            if z[j].include? sin
              grid[k][j] = sin
              #singles.delete(sin)
            end

          end # end of singles.each


        end # grid.each_with_index do |z, k|

# Check square grid
	xindex = (j%3-j)*-1
	yindex = (i%3-i)*-1 

	3.times do
	
	  3.times do 
	    if xindex == j && yindex == i
	      xindex += 1
	      next
            end

	    if grid[yindex][xindex].length == 1
	      y[j].tr!(grid[yindex][xindex],'')
	    end
	    xindex += 1
	  end
	  xindex = (j%3-j)*-1
	  yindex += 1
	end
      end #end of y.each_with_index
    end # end of grid.each_with_index


    if Sudoku.check_full(grid)          # Stop solve if grid is filled 
      puts "Solved!"
      Sudoku.print_grid(grid)
      break
    end
    
    if count == 29
      puts "Sorry, can't solve this. This is the best I can do:"
      Sudoku.print_grid(grid)
      break
    end
count += 1
  end # end of loop
  end # end of solve

end # end of Sudoku class



line = 1
gameboard = []
while line < 10 do

puts "Enter line ##{line} of your Sudoku below. For example, \"1 3 5 7 9\". If you make a mistake, type \"undo\" to redo the previous line."
input = gets.chomp

if input == "undo"
  line -= 1
  gameboard.pop
  next
end

input = input.split(//)
print input
puts
gameboard << input
line += 1


end

game = Sudoku.new(gameboard)
game.setup(game.grid)
game.solve(game.grid)
