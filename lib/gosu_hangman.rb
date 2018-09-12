  require 'gosu'
  require '../lib/hangman.rb'

  module ZOrder
    BACKGROUND, GRID, PEGS, UI, START = *0..4
  end

  class Hangman < Gosu::Window

    attr_accessor :prompt_text, :guess

    def initialize

      super 640, 480
      self.caption = "Hangman"

      @background_image = Gosu::Image.new("../media/grey_background.jpg", :tileable => true)

      @title_font = Gosu::Font.new(32, name: "Nimbus Mono L")
      @prompt_ln_1 = Gosu::Font.new(25, name: "Nimbus Mono L")
      @prompt_ln_2 = Gosu::Font.new(25, name: "Nimbus Mono L")
      @rules = Gosu::Font.new(20, name: "Nimbus Mono L")
      @guess_word = Gosu::Font.new(85, name: "Nimbus Mono L")

      @prompt_text = "Welcome to Hangman"
      @game = Game.new
      @game.select_word()
      @guess = @game.score
    end

    def needs_cursor?
      true
    end

    def update

    end

    def draw
      @background_image.draw(0,0,ZOrder::BACKGROUND)
      self.draw_line(0, 330, Gosu::Color::BLACK, 640, 330, Gosu::Color::BLACK, ZOrder::UI)
      #Draw Letters *.
      @guess_word.draw(@game.answer, 200, 280, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)


      
      @title_font.draw("Hangman", 250, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
      @prompt_ln_1.draw(@prompt_text, 10, 400, ZOrder::UI, 1.0, 1.0, Gosu::Color::GREEN)
      @prompt_ln_2.draw("You have #{@guess} guess's left.", 10, 425, ZOrder::UI, 1.0, 1.0, Gosu::Color::GREEN)
    end

    def button_down(id)

    end

    # Hit-test for selecting a button [SAVE, LOAD]
    def on_click
      
    end
  end

  Hangman.new.show
