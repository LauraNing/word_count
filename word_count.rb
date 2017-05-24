require 'fileutils'

def word_count
   local_filename= "words_test.txt"
   begin
      words = File.read(local_filename)
      puts words
   rescue=>e
      puts "error in reading file: #{e}"
   end

   word_hash = Hash.new
   
   text_array = Array.new
   text_array = words.split(/[\s,.]+/)

   text_array.each do |x| 
      if system("look #{x} > /dev/null 2>&1") 
         #puts "#{x} is a word"
         if !word_hash.has_key?("#{x}") 
            word_hash["#{x}"] = 0
         end
         k = "#{x}"
         v = word_hash["#{x}"]
         word_hash[k] = v+1 
      else
         puts "#{x} is not a word"
      end
   end
   word_hash.each do |k, v|
      puts "#{k}: #{v}"
   end
end



