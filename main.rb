require_relative "lib/mastermind"
require "colorize"

def menu
  puts "****************Wellcome to Mastermind****************".colorize(color: :blue, mode: :bold)
  puts "1 - Play the game\n2 - How to play\n3 - Exit"
  opcao = gets.to_i
  unless [1, 2, 3].include?(opcao)
    puts "Wrong Option. Try again".colorize(color: :red, mode: :bold)
    puts "1 - Play the game\n2 - How to play\n3 - Exit"
    opcao = gets.to_i
  end
  opcao
end

def intro
  puts "****************MASTERMIND****************".colorize(color: :blue, mode: :bold)
end

def how_to_play
  intro
  puts "You must guess the colors chosen by the bot in the correct order, it will notify you if you match any color and if you match any color in the correct position, in the fewer rounds you match all the colors, better"
  puts "Press enter to continue".colorize(color: :red)
  gets
end

include Mastermind

in_game = true

while in_game == true
  opcao = menu
  if opcao == 1
    game = Game.new
    while game.points_index != 4
      system "clear"
      intro
      game.check_colors
      game.player.round += 1
    end
  elsif opcao == 2
    how_to_play
  else
    exit
  end
end
