def print_name(arr,&block)
  for name in arr do
    block.call(name)
  end 
   
end

say = -> {puts "Hi"}

arr=["Jitu","Subhash","Bunde"]











print_name(arr) do |name|
  puts name
end

say.call
say_hi = -> (name){ puts name}

say_hi.call("jitu")





