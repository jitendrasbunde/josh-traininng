require "/home/jitendra/Training/josh-traininng/day6/referfile.rb"

class OyoBooking
  
  include Property::ObjectLevel
  extend Property::ClassLevel
  attr_accessor :name,:property_status,:property_area,:property_type,:amount,:mobile_no
  @@hs=Hash.new
  
  def initialize(mobile)
    @mobile_no=mobile
    self.get_info
    if mobile==nil
      hsh = OyoBooking.match(@property_area,@property_type,@@hs,@amount)
      self.print_list(hsh)
      self.book(@@hs)
    else
       @@hs.store(mobile_no,self)
    end
  end
end

class NextAway
  
  @@hs=Hash.new
  include Property::ObjectLevel
  extend Property::ClassLevel
  attr_accessor :name,:property_status,:property_area,:property_type,:amount,:mobile_no
  @@hs=Hash.new
  
  def initialize(mobile)
    @mobile_no=mobile
    self.get_info
    self.show_all
    if mobile==nil
      hsh = NextAway.match(@property_area,@property_type)
      self.print_list(hsh)
      self.book(@@hs)
     else
       @@hs.store(mobile_no,self)
     end
   end

end

class QuikrHomes

  @@hs=Hash.new
  include Property::ObjectLevel
  extend Property::ClassLevel
  attr_accessor :name,:property_status,:property_area,:property_type,:amount,:mobile_no
  @@hs=Hash.new

  def initialize(mobile)
    @mobile_no=mobile
    self.get_info
    self.show_all
    if mobile==nil
      hsh = QuikrHomes.match(@property_area,@property_type)
      self.print_list(hsh)
      self.book(@@hs)
     else
       @@hs.store(mobile_no,self)
     end
  end

end

class Operation

  @@hs=Hash.new

  def register
    puts " 1.do you want to sell Property \n 2.do you want to give on Rent \n 3.Use as a Hotel"
    obj =nil
    j= gets.to_i
    puts "Enter your mobile No "
    mobile=gets.chomp
    case j
    when 1 
      obj = QuikrHomes.new(mobile)
    when 2
      obj = NextAway.new(mobile)
    when 3
      obj = OyoBooking.new mobile
    else
      puts "Sorry you give mi wrong Information"
    end
  end

  def find
    puts " 1.do you want to bye Property \n 2.do you want to take on Rent \n 3.Book a Hotel Room"
    i = gets.to_i
    case i
    when 1 
      obj = QuikrHomes.new(nil)
    when 2
      obj = NextAway.new(nil)
    when 3
      obj = OyoBooking.new nil
    else
      puts "Sorry you give mi wrong Information"
    end
  end

  def all
    puts "1.Property  For Bye\n2.Property for rent \n3.Hotel Room's"
    i = gets.chomp.to_i

    case i
    when 1
      QuikrHomes.show(QuikrHomes.class_variable_get(:@@hs))
    when 2
      NextAway.show(NextAway.class_variable_get(:@@hs))
    when 3
      OyoBooking.show(OyoBooking.class_variable_get(:@@hs))
    else
      
    end
  end
  
end

while true
  puts "1 To register you Property \n2. a Property \n3.All Property\n4.Exit"
  i = gets.to_i
  obj=Operation.new
  case i
  when 1
    obj.register
  when 2 
    obj.find
  when 3
    obj.all
  when 4
    break
  else 
    puts "Wrong Option"
  end
end