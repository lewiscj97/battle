require 'sinatra'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions

  
  get '/' do
    erb(:index)
  end
  
  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @game = Game.create(player1, player2)
    redirect to('/play')
  end
  
  before do
    @game = Game.instance
  end

  get '/play' do
    @player1 = @game.player1
    @player2 = @game.player2
    erb(:play)
  end

  get '/attack' do
    @player1 = @game.player1
    @player2 = @game.player2
    @game.player1_turn? ? @game.attack(@player2) : @game.attack(@player1)
    redirect to('/result') if @game.game_ended?
    erb(:attack)
  end

  get '/result' do
    @winner = @game.winner.name
    erb(:result)
  end
end
