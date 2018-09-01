require 'yaml'

class Game

    attr_accessor :score

    def init
        @score = 0
    end

end


# 5desk.txt contains 5000 words randomly select one and disply
def select_word
    File.readlines("../5desk.txt")[rand(5000)]
end

puts "Welcome to Hangman"
word = select_word()
puts "A random word has been selected it is #{word.chomp.length} letters long"



