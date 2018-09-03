require 'yaml'

class Game

    attr_accessor :score, :word, :won, :answer

    def initialize
        select_word()
        @score = (@word.length) + 4
        
    end

    # 5desk.txt contains 5000 words randomly select one and disply
    def select_word
        @answer = ""
        @word = File.readlines("../5desk.txt")[rand(5000)].chomp
        puts "A random word has been selected it is #{@word.length} letters long"
        @word.scan(/./){@answer << '*'}
        puts @answer
    end

    def guess (letter)
        #take user input and check against word.

        @word.each_char.with_index do |l, i| 
            # Need to revert to full IF loop :-(
            l == letter ? @answer[i] = l : @score -= 1
        end
    end

    def game_won?
        @score == @word.length ? true : false
    end

end

def load_game

end



puts "Welcome to Hangman"
game = Game.new
puts game.word
while game.score > 0
    puts "you have #{game.score} gueses left!"
    puts "Enter a letter: "
    game.guess(gets.chop)
    puts game.answer + " You have #{game.score} guesses left"
end





