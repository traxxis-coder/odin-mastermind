class Guess < PegLine
  attr_accessor :guess_colors

  def self.player_guess
    puts 'Enter four comma separated color names to submit a guess.'
    Guess.new(gets.gsub(/\n|\s/, '').split(','))
  end

  def evaluate(code)
    rating = []
    4.times do |index|
      if pegs[index] == code.pegs[index]
        rating.push('x')
      elsif code.pegs.include?(pegs[index])
        rating.push('o')
      end
    end
    rating.sort.reverse.join(' ')
  end
end
