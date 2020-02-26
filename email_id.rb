str  = "jitu@gmail.com"
str2 = "255.255.255.255"

if str=~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
 puts "Good"    
else
    puts "Bad"
end
arry = str2.split(".")
count =0 
arry.each do  |x|
  if x.match(/\d{1,3}/) && x.to_i<=255 && x.to_i >=0
      count +=1
  end
end

if count==4
    puts "Valid Id "
else
    puts "Invalid ID" 
end
