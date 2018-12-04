require 'sinatra/base'
require './lib/user'
require './lib/space'
require './lib/comment'
require_relative './database_connection_setup'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end

  post '/user_signup' do
    @user = User.create_account(params[:username], params[:email], params[:password])
    redirect '/spaces'
  end

  get '/spaces' do
    @all_spaces = Space.list_spaces
    erb :spaces
  end

end
