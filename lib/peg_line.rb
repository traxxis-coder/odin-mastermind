require 'colorize'

# class PegLine contains all lines of 4 colored pegs
# - has subclasses Code and Guess
class PegLine
  COLORS = %i[green yellow red cyan blue magenta].freeze
  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  def self.colors
    colors = ''
    COLORS.each do |color|
      colors += "#{color.to_s.colorize(color)}\n"
    end
    colors
  end

  def to_s
    "#{'I'.colorize(pegs[0])} #{'I'.colorize(pegs[1])} #{'I'.colorize(pegs[2])} #{'I'.colorize(pegs[3])}"
  end
end
