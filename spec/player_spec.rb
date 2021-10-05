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
  
  describe '#attack' do
    it 'should decrement player hp by 10 when attacked' do
      test_player = Player.new('foo')
  
      expect{test_player.attack}.to change { test_player.hp }.from(100).to(90)
    end

    it 'should decrement player hp by 10 when attacked' do
      test_player = Player.new('foo')
  
      expect{
        5.times do test_player.attack end
      }.to change { test_player.hp }.from(100).to(50)
    end
  end
end