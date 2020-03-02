module Swimmable 
  def swim
    puts "i can swim"
  end
end 

class Animal
  include Swimmable
  def swim
    puts "inside the class"
  end
end

Animal.new.swim
puts Animal.ancestors
