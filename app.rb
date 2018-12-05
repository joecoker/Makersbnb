require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/space'
require './lib/comments'
require './lib/booking'
require_relative './database_connection_setup'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  post '/user_login' do
    begin
      session['user'] = User.login(
        username: params[:login_username],
        password: params[:login_password]
      )
      redirect '/spaces'
    rescue IndexError
      flash.now[:error] = "Incorrect username or password"
    end
  end

  get '/spaces' do
    @all_spaces = Space.list_spaces
    erb :spaces
  end

  get '/space_profile/:id' do
    @comments = Comment.show_comments_by_space(spaceid: params['id'])
    @space = Space.view_space_details(spaceid: params['id'])
    erb :space_profile
  end

  post '/create_comment/:id' do
    Comment.create(
      userid: session['user'].userid,
      spaceid: params['id'],
      comment_text: params['comment_text']
    )
    redirect "/space_profile/#{params['id']}"
  end

  get '/create-a-space' do
    @user = session['user']
    erb :create_space
  end

  post '/add-space' do
    user = session['user']
    id = User.get_user_id(username: user.username)
    Space.create_space(
      ownerid: id,
      spacename: params[:space_name]
    )
    redirect '/spaces'
  end

end
