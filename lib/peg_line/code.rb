require_relative '../peg_line'

class Code < PegLine
  def self.mastermind_code
    loop do
      code = Code.new(gets.gsub(/\n|\s/, '').split(',').map(&:to_sym))
      if code.valid?
        puts code
        return code
      end

      puts 'Invalid code, try again.'
    end
  end
end
