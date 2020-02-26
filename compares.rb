
str = "a5b12a3b9c10d15"
flag = 0
count = str.split(/[a-zA-Z]/)

alpha = str.split(/\d+/)
hs=Hash.new
p count
p alpha
alpha.each  do |x|
    hs.store(x,0)
end

count.each_with_index do |x,i|
  if x!=""
    if hs[alpha[i-1]]
      num = hs[alpha[i-1]]
      num = num + x.to_i
      hs[alpha[i-1]]=num   
    end
  end
end
print str,":-> "
hs.map do |k,v|
  print k,v
end
puts ""
