require 'rack-flash'
require 'json'
require 'http'
class FoodyCallApp < Sinatra::Base
  get '/login' do
    erb :login
  end

  post '/login' do
    #Add validation later
    user_data = params[:user]
    user_data = ActiveSupport::HashWithIndifferentAccess.new(user_data)
    user = AuthenticateUser.call(user_data)
    if user
      session[:current_user] = user.to_json
      erb :homepage
    else
      flash[:error] = 'Email or password is incorrect'
      erb :login
    end
  end

end
