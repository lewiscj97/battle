# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :hp

  def initialize(name, hp = 100)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= 10
  end
end
