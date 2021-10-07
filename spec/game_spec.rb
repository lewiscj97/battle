# frozen_string_literal: true

require 'game'

describe Game do
  let(:player1) { Player.new('Foo') }
  let(:player2) { Player.new('Bar') }
  let(:subject) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'is passed two players' do
      expect(subject.player1).to eq player1
      expect(subject.player2).to eq player2
    end

    it 'should be player 1\'s turn' do
      expect(subject.player1_turn?).to eq true
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

    it 'should switch to player 2 turn' do
      expect { subject.attack(player1) }.to change {
        subject.player1_turn?
      }.from(true).to(false)
    end
  end

  describe '#player1_turn?' do
    it 'should return player1 turn boolean' do
      expect(subject.player1_turn?).to eq true
    end
  end

  describe '#game_ended?' do
    it 'should return true if game has ended' do
      10.times { subject.attack(player1) }
      expect(subject.game_ended?).to eq true
    end
  end

  describe '#winner' do
    it 'should return the correct winner' do
      10.times { subject.attack(player1) }
      expect(subject.winner).to eq(player2)
    end
  end
end
