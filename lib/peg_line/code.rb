require_relative '../peg_line'

class Code < PegLine
  def initialize
    super(code_pegs)
  end

  def code_pegs
    color_list = []
    4.times { color_list.push(COLORS.sample.to_s) }
    color_list
  end
end
