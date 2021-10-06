require 'game'

describe Game do
  let(:player_1) { Player.new('Foo') }
  let(:player_2) { Player.new('Bar') }

  describe "#initialize" do
    it 'is passed two players' do
      game = Game.new(player_1, player_2)  
    end
  end
  
  describe '#attack' do
    it 'should decrement player hp by 10 when attacked' do
      subject.attack(player_1)
      expect(player_1.hp).to eq 90
    end

    it 'should decrement player hp by 10 when attacked' do
      5.times { subject.attack(player_1) }
      expect(player_1.hp).to eq 50
    end
  end
end
