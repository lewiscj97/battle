require 'sinatra'
require 'sinatra/reloader'
require './lib/player'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player1]).name
    $player2 = Player.new(params[:player2]).name
    redirect to('/play')
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    erb(:attack)
  end
end
