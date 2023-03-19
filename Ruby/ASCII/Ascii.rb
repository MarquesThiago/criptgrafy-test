class Ascii


    def word_to_ascii(word, number)
        word_ascii = ""

        word.each_byte do |letter|
            letter = (limiter_wcode_ascii(letter + number)).chr
            word_ascii += letter
         end
         return  word_ascii

    end


    def passing_letter (word, number)
        word_ascii = ""

        word.each_byte do |letter|
            letter = (limiter_wcode_ascii(letter + number, type_letter(letter))).chr
            word_ascii += letter
         end
         return  word_ascii
    end 

    
    private def limiter_wcode_ascii(codeAscii, type_letter = NIL)


       case type_letter
           
            when "special"
               
                return limiter(codeAscii,129, 165, 36)

            when "upper"
               
                return limiter(codeAscii, 91, 65 )

            when "lower"

                return limiter(codeAscii, 123, 97 )

            else

                return limiter(codeAscii, 254)
            end
    end

    private def limiter(codeAscii, nMax_letter, increment = NIL, rang = 25)

        
       _divisor = (codeAscii/nMax_letter).to_r

        if ( _divisor >= 1.0 && !increment )

            return codeAscii - (nMax_letter * (_divisor.to_i))

        elsif( _divisor >= 1.0 && increment.class == Integer )

            return increment + (codeAscii - (rang * (codeAscii / rang ).to_i))

        end
        
        return codeAscii
    
    end



    private def type_letter(num_letter)

        if( num_letter >= 65 && num_letter <=90)
            return "upper"
        elsif( num_letter >= 97 && num_letter <=122)
            return "lower"
        elsif( num_letter >= 128 && num_letter <=165)
            return "special"
        end

    end

    
end


