first = Proc.new do |n,v|  
  puts "#{n}  #{v}"  
  n+v  
end

second = lambda do |n,v|
  puts "#{n}  #{v}" 
    n+v
end

puts ""
print second.call(2,7)
print first.call(2,8,5,6,)


