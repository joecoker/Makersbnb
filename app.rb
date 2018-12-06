require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/space'
require './lib/comments'
require './lib/booking'
require './lib/owner'

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
    @dates = Space.view_availability(spaceid: params['id'])
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
    new_space = Space.create_space(
      ownerid: id,
      spacename: params[:space_name]
    )
    if params[:start_availability] != "" && params[:end_availability] != ""
      start_date = Date.strptime(params[:start_availability], '%Y-%m-%d')
      end_date = Date.strptime(params[:end_availability], '%Y-%m-%d')
      Space.add_availability_range(
        spaceid: new_space.id,
        start_date: start_date,
        end_date: end_date
      )
    end
    redirect '/spaces'
  end

  post '/create_booking/:id' do
    Booking.create_booking(userid: session['user'].userid,
      spaceid: params['id'] ,
      start_date: params['start_date'],
      end_date: params['end_date']
    )
    redirect "/your_bookings/#{session['user'].userid}"
  end

  get "/your_bookings/:userid" do
    @user_bookings = Booking.list_bookings_by_user(userid: session['user'].userid)
    @bookings_and_spaces = @user_bookings.map do |booking|
      space = Space.view_space_details(spaceid: booking.spaceid)
      booking.confirmed == true ? ready = "confirmed" : ready = "pending"
      {spacename: space[:spacename], confirmed: ready}
    end
    erb :your_bookings
  end

  get "/view-booking-requests" do
    @requests = Owner.list_booking_requests_by_owner(ownerid: session['user'].userid)
    erb :view_booking_requests
  end

end
