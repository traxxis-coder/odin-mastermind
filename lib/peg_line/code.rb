require_relative '../peg_line'

class Code < PegLine
  def initialize
    super(code_colors)
  end

  def code_colors
    color_list = []
    4.times { color_list.push(COLORS[(COLORS.size * rand).ceil - 1]) }
    color_list
  end
end
