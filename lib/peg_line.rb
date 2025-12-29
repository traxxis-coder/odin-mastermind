require 'colorize'

# class PegLine contains all lines of 4 colored pegs
# - has subclasses Code and Guess
class PegLine
  COLORS = %i[green yellow red cyan blue magenta].freeze
  def initialize(colors)
    @slot1 = colors[0]
    @slot2 = colors[1]
    @slot3 = colors[2]
    @slot4 = colors[3]
  end

  def self.colors
    puts 'green'.colorize(:green)
    puts 'yellow'.colorize(:yellow)
    puts 'red'.colorize(:red)
    puts 'cyan'.colorize(:cyan)
    puts 'blue'.colorize(:blue)
    puts 'magenta'.colorize(:magenta)
  end

  def to_s
    "#{'I'.colorize(@slot1)} #{'I'.colorize(@slot2)} #{'I'.colorize(@slot3)} #{'I'.colorize(@slot4)}"
  end
end
