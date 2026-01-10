require_relative 'peg_line'

module AIGuess
  def self.random_guess(code, max_guesses)
    answer = []
    1.upto(max_guesses) do |guesses|
      guess = Guess.random_pegs
      puts "Guess \##{guesses}:\n#{guess}"
      4.times do |index|
        answer[index] = guess.pegs[index] if guess.pegs[index] == code.pegs[index]
      end
      if answer == code.pegs
        puts "The computer got it in #{guesses} guesses."
        puts "Final answer: #{Guess.new(answer)}"
        break
      end
      puts 'The computer has run out of guesses.'
    end
  end
end
