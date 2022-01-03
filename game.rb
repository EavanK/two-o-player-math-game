require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
  end
end