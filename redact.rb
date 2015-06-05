puts "Text to search through: "
text = gets.chomp
puts "Words to redact (separate words with comma and space): "
redact = gets.chomp

words = text.split(" ")
reds = redact.split(", ")

words.each { |x|

	reds.each_with_index { |y, index|

	if (x != y) && (index == reds.size - 1)
		print x + " "
		break
	elsif (x == y) 
		print "***** "
		break
	else next
	end
	}

}
