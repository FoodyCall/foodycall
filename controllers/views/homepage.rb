require 'rack-flash'
require 'json'
class FoodyCallApp < Sinatra::Base
  get '/' do
    @events = RetrieveEvents.call()
    @user_id = @current_user['id']
    erb :homepage
  end
end
