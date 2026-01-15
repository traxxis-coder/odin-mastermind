# frozen_string_literal: true

require_relative 'peg_line'

module AIGuess
  def self.advanced_random(code, max_guesses)
    puts 'Using an advanced random algorithm.'
    options = []
    4.times { options.push(PegLine::COLORS.map(&:clone)) }
    1.upto(max_guesses) do |guesses|
      guess = AIGuess.random_guess(options)
      puts "Guess \##{guesses}:\n#{guess}"
      if guess.pegs == code.pegs
        puts "The computer got it in #{guesses} guesses."
        break
      end
      AIGuess.update_options(code, guess, options)
      puts 'The computer has run out of guesses.' if guesses == max_guesses
    end
  end

  def self.random_guess(options)
    guess_pegs = options.map do |peg|
      if peg.is_a?(Array)
        peg.sample
      else
        peg
      end
    end
    Guess.new(guess_pegs)
  end

  def self.update_options(code, guess, options)
    4.times do |index|
      if guess.pegs[index] == code.pegs[index]
        options[index] = guess.pegs[index]
      else
        options[index].delete(guess.pegs[index])
      end
    end
  end
end
