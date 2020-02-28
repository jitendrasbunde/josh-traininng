# Blocks Lambda & Proc
def find(file_path)  
  sample_file =  File.open(file_path,"r")
  arr_text = sample_file.read()
  arr_split = arr_text.split(" ")
  puts "In Find Function For read the file"
  -> (word){if arr_split.include? word 
              puts "Found"
            else 
              puts "Not Found" 
            end}
end

puts "Please give me a file path "
file_path=gets.chomp.to_s
if File.exist?(file_path)
  
  fun = find(file_path)
  puts fun

  while true
    puts "Press 1 to Find in File \nPress 0 For Exit"
    i=gets.chomp.to_i
    case i
    when 1
      puts "Which Word"
      word = gets.chomp.to_s
      fun.call(word)
    when 0
      break
    else
      puts "Wrong Option"
    end
  end
else
end

