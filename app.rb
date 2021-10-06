require 'sinatra'
require 'sinatra/reloader'
require './lib/player'
require 'game'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect to('/play')
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    Game.new.attack($player2)
    erb(:attack)
  end
end
