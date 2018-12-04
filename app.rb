require 'sinatra/base'
require './lib/user'
require './lib/space'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end

  post '/' do
    
  end
end
