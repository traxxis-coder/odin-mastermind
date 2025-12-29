require_relative 'peg_line/code'

class PlayGame
  def initialize
    @code = Code.new
    puts PegLine.colors
  end
end
