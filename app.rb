require 'sinatra/base'
require './lib/user'
require './lib/space'
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
  
  get '/space_profile/:id' do
    erb :space_profile
  end

  post '/create_comment' do

    redirect '/space_profile/:id'
  end
  
  get '/create-a-space' do
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
