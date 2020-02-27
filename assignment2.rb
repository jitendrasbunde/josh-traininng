Str  = gets.to_s

if str=~/\A[\w+\.-]+\@[a-zA-z0-9\-.]+\.[a-z]\Z/
 puts "Good"    
else
    puts "Bad"
end