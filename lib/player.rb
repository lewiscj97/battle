# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :hp

  def initialize(name, hit_points = 100)
    @name = name
    @hp = hit_points
  end

  def receive_damage
    @hp -= 10
  end
end
