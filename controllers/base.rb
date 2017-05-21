require 'sinatra'

# Base class for ConfigShare Web Application
class FoodyCallApp < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.dirname(__FILE__) + '/../public'

  before do
    # Validation of authenticated user
    # if session[:current_user]
    #   @current_user = SecureMessage.decrypt(session[:current_user])
    #   @auth_token = session[:auth_token]
    #   puts @current_user
    #   puts session[:auth_token]
    # end
  end

  def login_account(authorized_account)
    @current_user = authorized_account['data']['user']
    session[:auth_token] = authorized_account['data']['auth_token']
    session[:current_user] = SecureMessage.encrypt(@current_user)
    # flash[:notice] = "Welcome back #{@current_user['username']}"
  end

  get '/' do
    erb :landing
  end
end
