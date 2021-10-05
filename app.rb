require 'sinatra'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post '/names' do
    session['player1'] = params[:player1]
    session['player2'] = params[:player2]
    redirect to('/play')
  end

  get '/play' do
    @player1 = session['player1']
    @player2 = session['player2']
    erb(:play)
  end

  get '/attack' do
    @player1 = session['player1']
    @player2 = session['player2']
    erb(:attack)
  end
end
