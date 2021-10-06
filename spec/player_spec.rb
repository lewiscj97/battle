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
end
