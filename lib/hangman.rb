require 'yaml'

class Game

    attr_accessor :score, :word, :won, :answer

    def initialize
        select_word()
        @score = (@word.length) + 2
        
    end

    # 5desk.txt contains 5000 words randomly select one and display.
    def select_word
        @answer = ""
        @word = ""
        while not is_valid?
            @word = IO.readlines("../5desk.txt")[rand(61405)].chomp
        end
        @word.downcase!
        puts @word
        @word.scan(/./){@answer << '*'}
        puts @answer
    end

    def guess (letter)
        #take user input and check against word.
        if letter == "S"
            #Save Game & Exit
            save_game()
        else
            found = false
            letter.downcase!
            @word.each_char.with_index do |l, i| 
                if l == letter 
                    @answer[i] = l
                    found = true
                end   
            end
            found ? @score : @score -= 1
        end
    end

    def game_won?
        @answer.include?('*') ? false : true
    end

    def self.load_game
        Dir.glob("games/*.yml").each {|n| puts n}
        puts "Please type the name of the game you wich to load:"
        print ":> "
        filename = gets.chomp
        saved_file = File.open(filename, 'r')
        YAML.load(saved_file)
    end

    private

    def is_valid?
        @word.length > 13 || @word.length < 5 ? false : true
    end

    def save_game
        puts "Please enter a file name (no spaces): "
        name = gets.chomp
        Dir.mkdir("games") unless Dir.exists? "games"
        File.open(File.join( "games", "#{name}.yml"), 'w') { |file| file.puts self.to_yaml}
    end

end # Game








