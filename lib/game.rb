require 'player'

class Game
  def attack(player)
    player.hp -= 10
  end
end
