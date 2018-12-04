require 'sinatra/base'
require './lib/user'
require './lib/space'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/spaces' do
    @all_spaces = Space.list_spaces
    erb :spaces
  end
end
