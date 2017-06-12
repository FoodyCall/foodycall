require 'rack-flash'
require 'json'
require 'http'
class FoodyCallApp < Sinatra::Base
  get '/events/new' do
    erb :new_event
  end

  post '/events/new' do
    #Add validation later
    flash[:info] = params.to_json
    # if params[:user]['password'] != params[:user]['password2']
    #   flash[:error] = 'Password confirmation not matching'
    #   erb :signup
    # else
    #   user_data = params[:user]
    #   user_data = ActiveSupport::HashWithIndifferentAccess.new(user_data)
    #   saved_user = CreateUser.call(user_data)
    #   if saved_user
    #     session[:current_user] = saved_user.to_json
    #     flash[:info] = "User Created. Please log in"
    #     erb :login
    #   else
    #     flash[:error] = 'Error Creating User. Please check information'
    #     erb :signup
    #   end
    # end

  end

  post '/events/join' do
    #Add validation later
    joined = JoinEvent.call(
      user_id: @current_user['id'],
      event_id: params[:event_id],
      roles: params[:roles],
      message: params[:message]
    )
    if joined
      flash[:info] = "Thank you for joining. Please wait host to approve your request"
      redirect '/'
    else
      flash[:error] = 'Error joining event.Please try again later'
      redirect '/'
    end

  end
end
