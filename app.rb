require 'sinatra/base'
require './lib/user'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end

  post '/' do
    
  end
end
