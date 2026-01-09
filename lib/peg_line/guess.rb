class Guess < PegLine
  attr_accessor :guess_colors

  def self.player_guess
    puts 'Enter four comma separated color names to submit a guess.'
    Guess.new(gets.gsub(/\n|\s/, '').split(',').map(&:to_sym))
  end

  def evaluate(code)
    code_pegs = code.pegs.map(&:clone)
    pegs = self.pegs
    rating = []
    4.times do |index|
      next unless pegs[index] == code_pegs[index]

      rating.push('x')
      code_pegs[index] = nil
      pegs[index] = nil
    end
    code_pegs.compact!
    4.times do |index|
      if code_pegs.include?(pegs[index])
        rating.push('o')
        code_pegs.delete(pegs[index])
      end
    end
    rating.join(' ')
  end
end
