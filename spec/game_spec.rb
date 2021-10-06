require 'game'

describe Game do
  let(:player) { double :player, name: 'foo', hp: 100 }

  describe '#attack' do
    it 'should decrement player hp by 10 when attacked' do
      allow(player).to receive(:hp=).with(90)
      subject.attack(player)
      allow(player).to receive(:hp) { 90 }
      expect(player.hp).to eq 90
    end

    it 'should decrement player hp by 10 when attacked' do
      test_player = Player.new('foo')
  
      expect{
        5.times { test_player.attack }
      }.to change { test_player.hp }.from(100).to(50)
    end
  end
end
