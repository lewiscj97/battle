require 'game'

describe Game do
  let(:player) { Player.new('Foo') }

  describe '#attack' do
  
    it 'should decrement player hp by 10 when attacked' do
      subject.attack(player)
      expect(player.hp).to eq 90
    end

    it 'should decrement player hp by 10 when attacked' do
      5.times { subject.attack(player) }
      expect(player.hp).to eq 50
    end
  end
end
