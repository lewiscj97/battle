require 'game'

describe Game do
  let(:player1) { Player.new('Foo') }
  let(:player2) { Player.new('Bar') }
  let(:subject) { Game.new(player1, player2) }

  describe "#initialize" do
    it 'is passed two players' do
      game = Game.new(player1, player2)
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
    end
  end
  
  describe '#attack' do
    it 'should decrement player hp by 10 when attacked' do
      subject.attack(player1)
      expect(player1.hp).to eq 90
    end

    it 'should decrement player hp by 10 when attacked' do
      5.times { subject.attack(player1) }
      expect(player1.hp).to eq 50
    end
  end
end
