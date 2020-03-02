require "/home/jitendra/Training/josh-traininng/day6/referfile.rb"

class OyoBooking
    include Property::ObjectLevel
    extend Property::ClassLevel
    def initialize
     self.area 
    end
  end

  obj= OyoBooking.new