Encoding.default_internal = Encoding::UTF_8
require_relative "../ASCII/Ascii"

class Cesar

    ASCII = Ascii.new
    
    def initialize(fileCrypt, passing)
        @@fileCrypt = fileCrypt
        @@passing = passing
        @@temp = []
        @@word_transformed = ""
    end

    
    private def array_words()
      return  @@fileCrypt.split(" ")
    end

    private def transform
        if block_given? 
            array_words.each do |arrayWord|
                yield(arrayWord)
            end 

        end

    end    

    private def _with_ascii(arrayWord)
        word_transformed = ASCII.word_to_ascii(arrayWord, @@passing)
        @@temp.append(word_transformed)
    end

    

    private def _alpha_ascii(array_word)
        word_transformed = ASCII.passing_letter(array_word, @@passing)
        @@temp.append(word_transformed)
        
    end


    def transform_with_ascii()
        transform do |arrayWord|
            _with_ascii(arrayWord)
        end
        union()
        return @@word_transformed
        
    end   


    def transform_Alpha_ascii()
        transform do |arrayWord|
            _alpha_ascii(arrayWord)
        end
        union()
        return @@word_transformed
        
    end  

    
    def easy ()
        array_words.each do |arrayWord|
            _alpha_ascii(arrayWord.downcase)
        end
        union()
        return @@word_transformed
    end

    
    def easy_upper()
        array_words.each do |arrayWord|
            _alpha_ascii(arrayWord.upcase)
        end
        union()
        return @@word_transformed
    end

    def union()
       @@word_transformed =  @@temp.join(" ")
       @@temp = []
    end

end
