# frozen_string_literal: true

require_relative 'peg_line/code'
require_relative 'peg_line/guess'

# The PlayGame class controls the flow of the game
class PlayGame
  @@max_guesses = 12
  @@rules = "You have #{@@max_guesses} rounds to find a randomly generated code.
The code consists of 4 colored pegs. The possible colors are:
#{PegLine.colors}
You can recieve 2 kinds of feedback:
x - a peg is the right color and in the right place
o - a peg is the right color but in the wrong place"

  attr_reader :code
  attr_accessor :guesses

  def initialize
    @code = Code.new
    @guesses = 0
    puts @@rules
    play_game
  end

  def play_game
    @@max_guesses.times do
      result = play_round
      puts result
      self.guesses += 1
      if result == 'x x x x'
        puts "You win! It took you #{guesses} guesses. Good job!"
        break
      end
    end
  end

  def play_round
    guess = Guess.player_guess
    puts guess
    guess.evaluate(code)
  end
end
