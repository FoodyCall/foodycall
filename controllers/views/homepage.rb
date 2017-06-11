require 'rack-flash'
require 'json'
class FoodyCallApp < Sinatra::Base
  get '/' do
    @events = RetrieveEvents.call()
    erb :homepage
  end
end
