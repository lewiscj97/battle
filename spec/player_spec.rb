# frozen_string_literal: true

require 'player'

describe Player do
  describe '#initialize' do
    it 'should return the player name' do
      expect(described_class.new('foo').name).to eq 'foo'
    end

    it 'should return the player hp' do
      expect(described_class.new('foo').hp).to eq 100
    end
  end

  describe '#receive_damage' do
    before(:each) do
      @test_player = Player.new('foo')
    end
    it 'should decrement player hp by 10 when attacked' do
      expect do
        @test_player.receive_damage
      end.to change { @test_player.hp }.from(100).to(90)
    end

    it 'should decrement player hp by 50 when attacked x5' do
      expect do
        5.times { @test_player.receive_damage }
      end.to change { @test_player.hp }.from(100).to(50)
    end
  end
end
