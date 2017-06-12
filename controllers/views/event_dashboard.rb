require 'rack-flash'
require 'json'
require 'http'
class FoodyCallApp < Sinatra::Base

  get '/dashboard/:id' do
    erb :event_dashboard
  end

  get '/dashboard' do
    @user_id = @current_user['id']
    @events = RetrieveEvents.call()
    @events_host = RetrieveEvents.events_host(user_id:@user_id)
    @events_join = RetrieveEvents.events_joined(user_id:@user_id)
    @events_pending = RetrieveEvents.events_pending(user_id:@user_id)

    erb :dashboard
  end

end
