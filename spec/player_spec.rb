require 'player'

describe Player do

  it 'should return the player name' do
    expect(Player.new('foo').name).to eq 'foo' 
  end
end