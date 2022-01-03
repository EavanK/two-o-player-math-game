require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
  end

  # keep turning over until one of the player's life is equal to 0
  def turn_over
    if @players.find {|p| p.lives == 0 }
      puts "\n----- WINNER -----"
      game_over
    else
      puts "\n---- NEW TURN -----"
    end
  end

  # the player whose life isn't equal to 0 is the winner
  def get_winner
    @players.find {|p| p.lives != 0}
  end

  def game_over
    puts "\n#{get_winner.name} wins with a score of #{get_winner.lives}/3"
    puts "\n----- GAME OVER -----"
    puts "Good Bye!"
  end

  # play game
  def play
    puts "\n--- Welcome to TwO-O-Player Math Game ---"
    puts "\n----- GAME START -----"

    # play until one of the player's life is equal to 0
    until @players.find {|p| p.lives == 0 } do

      question = Question.new

      puts "#{@players.first.name}: what does #{question.first_num} plus #{question.second_num} equal?"
      print "> "
      player_answer = gets.chomp.to_i

      # if a player answers wrong, lose 1 life
      puts (
        if player_answer == question.answer
          "#{@players.first.name}: YES! You are correct."
        else
          @players.first.wrong_answer
          "#{@players.first.name}: Seriously? No!"
        end
      )
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

      @players.reverse!
      turn_over
    end
  end
end