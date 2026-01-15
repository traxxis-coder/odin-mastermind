# frozen_string_literal: true

require_relative 'peg_line/code'
require_relative 'peg_line/guess'
require_relative 'ai_guess'

# The PlayGame class controls the flow of the game
class PlayGame
  @@max_guesses = 12
  @@rules = "You have #{@@max_guesses} rounds to find a randomly generated code.
The code consists of 4 colored pegs. The possible colors are:
#{PegLine.colors}
You can recieve 2 kinds of feedback:
x - a peg is the right color and in the right place
o - a peg is the right color but in the wrong place"
  @@mastermind_rules = "Enter four comma separated colors to generate a code.
The colors at your disposal are:
#{PegLine.colors}"

  attr_reader :code
  attr_accessor :guesses

  def initialize
    @guesses = 0
    play_game
  end

  def play_game
    if choose_role == 'g'
      play_as_guesser
    else
      play_as_mastermind
    end
  end

  def play_as_guesser
    @code = Code.random_pegs
    puts @@rules
    @@max_guesses.times do
      result = play_round
      puts result
      self.guesses += 1
      break if game_over?(result)
    end
  end

  def play_as_mastermind
    puts @@mastermind_rules
    code = Code.mastermind_code
    AIGuess.advanced_random(code, @@max_guesses)
  end

  def play_round
    guess = Guess.player_guess
    puts guess
    guess.evaluate(code)
  end

  def choose_role
    loop do
      puts 'Do you want to guess a random code (g) or be the mastermind and have the computer guess (m)?'
      role = gets.gsub(/\n|\s/, '')
      return role if %w[g m].include?(role)

      puts 'Invalid input, try again.'
    end
  end

  def game_over?(result)
    if result == 'x x x x'
      puts "You win! It took you #{guesses} guesses. Good job!"
      true
    elsif self.guesses == @@max_guesses
      puts 'Sorry, you lost. Better luck next time.'
      true
    else
      false
    end
  end
end
