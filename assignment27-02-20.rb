class Book
  attr_accessor :id,:name,:type,:no_of_page,:no_of_book,:status,:issue_date,:return_date
  @@book_hash = Hash.new
 
  

  def self.read 
    puts "Start to read the book"
  end

  def issue_to(name)
    puts "which tyoe of book it is?"
    type=gets.to_s
    time = Time.new
    @issue_date= "#{time.day}-#{time.month}-#{time.year}"
  end

  def self.show
    @@book_hash.each{|k,v| puts "#{k}=>#{v} "}
  end
end



class Member
    attr_accessor :id,:name,:type,:gender,:valid,:book_list

    def initialize(id)
      @id=id
      @array = Array.new 
      @book_list = Array.new 
    end
    def borrow
      if id!=nil  
        puts "Which Book"
        name = gets
        book=Book.new 
        book.name = name
        if !@array.include? name
          if Book.class_variable_get(:@@book_hash)[id]
            Book.class_variable_get(:@@book_hash)[id]=@array
          else
            Book.class_variable_get(:@@book_hash).store(id,@array)
          end
          book.issue_to(name)
          @array<<name
          @book_list<<book
        else
            puts "This Book you already borrow by you"
        end
      end
    end

    def issue_books
      @book_list.each{ |x| p "Book :-> #{x.name}Issue  on date #{x.issue_date} return in Next 30 days"} 
    end
end


obj=Member.new(10)
obj.borrow
obj.borrow
Book.show
obj.issue_books