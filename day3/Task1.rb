first = Proc.new{|n,v| puts "#{n}  #{v}"
                     n+v    
                }
second = -> (n,v){puts "#{n}  #{v}" 
                  n+v
                    }
print second.call(2,7)
print first.call(2,8,5,6,)


