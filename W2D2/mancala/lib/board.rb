class Board
  attr_accessor :cups, :stone

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      4.times {cup << :stone  unless idx == 6 || idx == 13}
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (1...13).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    cups[start_pos] = []

    cup_idx = start_pos

    until cups[start_pos].empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- get to choose where to start again
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # ended on empty cup -- switches players' turns
      :switch
    else
      # ended on cup with stones in it -- automatically starts there
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
