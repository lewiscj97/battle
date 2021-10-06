require 'player'

class Game
  attr_reader :player1, :player2
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_turn = true
  end

  def attack(player)
    player.receive_damage
  end

  def player1_turn?
    @player1_turn
  end

end
