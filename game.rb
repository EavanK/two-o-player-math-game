require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
  end

  def turn_over
    puts "\n----- NEW TURN -----"
  end

  # play game
  def play
    puts "\n----- GAME START -----"

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