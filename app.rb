require 'sinatra/base'
require './lib/user'
require './lib/space'
require_relative './database_connection_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/user_signup' do
    session['user'] = User.create_account(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect '/spaces'
  end

  get '/spaces' do
    @all_spaces = Space.list_spaces
    erb :spaces
  end

  get '/create-a-space' do
    @user = session['user']
    erb :create_space
  end

  post '/add-space' do
    id = User.get_user_id(username: params[:username])
    Space.create_space(
      ownerid: id,
      spacename: params[:space_name]
    )
    redirect '/spaces'
  end
end
