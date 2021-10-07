require_relative 'player'

class Game
  attr_reader :player1, :player2
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_turn = true
    @winner = nil
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end
  
  def self.instance
    @game
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

  def winner
    dead?(@player1) ? @player2 : @player1
  end

  private 
  def switch_turn
    @player1_turn = !@player1_turn
  end

  def dead?(player)
    player.hp <= 0
  end

end

