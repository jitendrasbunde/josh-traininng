$arr = Array.new([11,22,33,44,55,66,77,88,99])

def for_loop
  puts "--------------For_Loop----------------"
  for num in $arr do
    print "#{num} " 
  end
end

def while_loop
  puts "--------------While_Loop----------------"
  i=0
  while i < $arr.length
    print "#{$arr[i]} "
    i+=1
  end
end

def each_loop
  puts "--------------Each_Loop----------------"
  $arr.each do |x|
    print "#{x} "
  end
end

def times_loop
  puts "--------------Times_Loop----------------"
  10.times{ |x| print "#{x} " }
end

def range_loop
  puts "--------------Range_Loop----------------"
  (90..100).each{|x| print "#{x} " }
  
end

def until_loop
  puts "--------------Until_Loop----------------"
  i=1
  until i==0
    puts "Enter any number And For Exit Press 0"
    i=gets.chomp.to_i
  end
end

def upto_loop
  puts "--------------Upto_Loop----------------"
  2.upto(5){|x| print "#{x} "}
  puts 
end
# Blocks Lambda & Proc

while true
  puts "\n1.For \n2.While \n3.each\n4.times\n5.range\n6.until\n7.upto\n0.Exit"
   i=gets.chomp.to_i
  case i
  when 1
    for_loop
  when 2
    while_loop
  when 3
    each_loop
  when 4
    times_loop
  when 5
    range_loop
  when 6
    until_loop
  when 7
    upto_loop
  when 0
    break
  else
    puts "Wroung Option"
  end
end

