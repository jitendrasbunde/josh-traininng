class Book
  def initialize(name,author,pages,publisher)
    @name=name 
    @author=author
    @pages=pages
    @publisher=publisher
  end

  def read
    @name
  end

  def author_method
    @name
    puts "Private mathod "
    puts read
  end

  def  get_author
    @author
  end


  def  get_pages
    @author
  end

  def  get_publisher
    @author
  end
  def get_name
    @name
  end

  def set_name name
    @name=name
    true
  end

  def set_author author
    @author=author
    true
  end

  def set_pages pages
    @pages=pages
    true
  end

  def set_publisher publisher
    @publisher=publisher
    true
  end

  def self.read
    return true
  end
end

obj=Book.new("Wings_Of_Fire","APJ",210,"India")
puts obj.author_method
puts Book.read

puts obj.get_name

