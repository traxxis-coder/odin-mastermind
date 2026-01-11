require_relative 'peg_line'

module AIGuess
  def self.random_guess(code, max_guesses)
    puts 'Using a basic random algorithm.'
    answer = []
    1.upto(max_guesses) do |guesses|
      guess = Guess.random_pegs
      puts "Guess \##{guesses}:\n#{guess}"
      AIGuess.update_answer(code, guess, answer)
      if answer == code.pegs
        puts "The computer got it in #{guesses} guesses."
        puts "Final answer: #{Guess.new(answer)}"
        break
      end
      puts 'The computer has run out of guesses.' if guesses == max_guesses
    end
  end

  def self.advanced_random(code, max_guesses)
    puts 'Using an advanced random algorithm.'
    answer = [nil, nil, nil, nil]
    1.upto(max_guesses) do |guesses|
      guess_pegs = answer.map do |peg|
        if peg.nil?
          PegLine::COLORS.sample
        else
          peg
        end
      end
      guess = Guess.new(guess_pegs)
      puts "Guess \##{guesses}:\n#{guess}"
      AIGuess.update_answer(code, guess, answer)
      if answer == code.pegs
        puts "The computer got it in #{guesses} guesses."
        break
      end
      puts 'The computer has run out of guesses.' if guesses == max_guesses
    end
  end

  def self.update_answer(code, guess, answer)
    4.times do |index|
      answer[index] = guess.pegs[index] if guess.pegs[index] == code.pegs[index]
    end
  end
end
