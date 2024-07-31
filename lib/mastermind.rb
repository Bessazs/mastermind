require "colorize"

module Mastermind
  
  class Game

    attr_accessor :player, :points, :points_index
    attr_reader :list_colors
    
    def initialize
   
      @list_colors = ["Black", "Blue", "Gray", "Green", "Red", "Purple", "Violet", "Pink", "Yellow", "White"].shuffle.slice(0..3)
      @player = Player.new
      @points_index = 0
      @points = 0
    end

    def check_colors
      @points_index = 0
      @points = 0
      @player.choose_colors
      @list_colors.each_with_index do |color, index|
        @player.colors.each_with_index do |color_player, index_player|
          if color_player == color && index_player == index
            @points_index += 1
          end
          if color_player == color
            @points +=  1
          end 
        end
      end
      if @points_index == 4
        puts "Congratulations you win the game in #{@player.round} rounds!!".colorize(:green)
        puts "Press enter to back to menu".colorize(:red)
        gets
      else
        puts "You pick #{@points.to_s.colorize(:green)} correct colors and #{@points_index.to_s.colorize(:green)} colors in the correct position\n\n"
        puts "Press enter to continue".colorize(:red)
        gets
      end
    end
  end

  class Player
    attr_accessor :colors, :round
    def initialize()
      @colors = []
      @round = 0
    end

    def choose_colors()
      puts "Enter 4 colors that you need to guess separated by space:"
      @colors = gets.split

      while @colors.size != 4 
        puts "Incorrect amount of colors, try again"
        @colors = gets.split
       
      end
      @colors.map! { |x| x.capitalize()}
      @colors
    end
  end

end






