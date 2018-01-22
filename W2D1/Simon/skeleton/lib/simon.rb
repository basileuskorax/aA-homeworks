require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system('clear')
    end
    game_over_message# if @game_over
    reset_game# if @game_over
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color.colorize(color.to_sym)
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts 'Enter the colors in the sequence you saw them in.'
    @seq.each do |color|
      input = gets.chomp
      if input != color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    puts 'Okay. Let\'s go again.'
  end

  def game_over_message
    puts 'Incorrect. Game over.'
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

Simon.new.play
