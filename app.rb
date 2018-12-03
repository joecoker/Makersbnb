require 'sinatra/base'
require 'user'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end
end
