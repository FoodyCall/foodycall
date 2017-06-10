require 'rack-flash'
require 'json'
require 'http'
class FoodyCallApp < Sinatra::Base
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    #Add validation later
    if params[:user]['password'] != params[:user]['password2']
      flash[:error] = 'Password confirmation not matching'
      erb :signup
    else
      user_data = params[:user]
      user_data = ActiveSupport::HashWithIndifferentAccess.new(user_data)
      saved_user = CreateUser.call(user_data)
      if saved_user
        session[:current_user] = saved_user.to_json
        flash[:info] = "User Created. Please log in"
        erb :login
      else
        flash[:error] = 'Error Creating User. Please check information'
        erb :signup
      end
    end

  end
end
