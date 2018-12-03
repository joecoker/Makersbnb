require 'sinatra/base'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :homepage
  end
end
