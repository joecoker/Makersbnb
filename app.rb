require 'sinatra/base'
require './lib/user'
require './lib/space'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end

  post '/user_signup' do
    @user = User.create_account(params[:username], params[:email], params[:password])
    redirect '/spaces'
  end




end
