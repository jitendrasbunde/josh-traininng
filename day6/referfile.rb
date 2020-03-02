module Property
  module ObjectLevel

    def print_list(hsh)
      hsh.each do |key,obj|
        print "Mobile:-> #{key} \nArea in sq ft is #{obj.property_area} \nProperty_Status :-> #{obj.property_status} \nAmount is #{obj.amount} \n"
      end
    end

    def get_info
      p " Enter your name :-> "
      @name = gets.chomp.to_s
      p " Property area in sq ft :-> "
      @property_area=gets.chomp.to_i
      p " property_type"
      @property_type=gets.chomp.to_s
      p " Amount of one Room for 23 hr 12:00 PM to 11:00 AM"
      @amount=gets.chomp.to_i

      @property_status="Availabe"
    end

    def book(hs)
      puts "Enter the Mobile No of Property Owner"
      i=gets.chomp
      if hs.has_key?(i)
        obj=hs[i]
        if obj.property_status=="Availabe"
          obj.property_status="Booked by #{self.name}"
        else
          puts "Sorry Not Availabe" 
        end
      else
        puts "Sorry You give me Wrong Number"
      end
    end
  end

  module ClassLevel
    def match area,type,hs,amount
      hsh = Hash.new
      hs.map do |k,v|
          if type==v.property_type and v.property_area>area and v.amount<amount
           hsh.store(k,v)
          end
      end
      hsh
    end

    def show(hs)
      print "mobile_no  |  Name |  Type |  Status |  Area |  Amount\n"
      hs.map do |k,v|
        print "\n#{k}  |  #{v.name} |  #{v.property_type} |  #{v.property_status} |  #{v.property_area} |  #{v.amount}\n"
      end
    end
  end
end