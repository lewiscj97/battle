require_relative 'player'

class Game
  attr_reader :player1, :player2
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_turn = true
  end

  def attack(player)
    player.receive_damage
    switch_turn
  end

  def player1_turn?
    @player1_turn
  end

  def game_ended?
    dead?(@player1) || dead?(@player2) 
  end

  private 
  def switch_turn
    @player1_turn = !@player1_turn
  end

  def dead?(player)
    player.hp <= 0
  end

end
