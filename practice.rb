class Sample
    def show
        puts "In Methods #{self}"
    end

    def self.read
        puts "#{self} in read "
    end
end

obj=Sample.new
puts obj
obj.show
puts "---------------------------------"
puts Sample.read

