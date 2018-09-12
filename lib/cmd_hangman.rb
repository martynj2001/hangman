require '../lib/hangman.rb'

puts "Welcome to Hangman"
puts "Would you like to star a new game or load and existing one."
puts "Type:"
puts " P - Play."
puts " L - Load exisiting game."
print ":> "

if gets.chomp == 'L'
    game = Game::load_game
else
    game = Game.new
end    
puts "You can save your game anytime by typing \'S\'"
while game.score > 0
    if game.game_won?
       puts "Winner!!"
        break
    else
        puts "you have #{game.score} guesses left!"
        puts "Enter a letter: "
        game.guess(gets.chomp)
        puts game.answer + " You have #{game.score} guesses left!"
    end
end