require 'sinatra'
require 'rack-flash'


# Base class for ConfigShare Web Application
class FoodyCallApp < Sinatra::Base
  enable :logging
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.dirname(__FILE__) + '/../public'

  disable :protection  # required for Rack::Protection middleware below
  use Rack::Session::Cookie, secret: ENV['MSG_KEY'],
                             expire_after: 60 * 60 * 24 * 7
  use Rack::Flash
  # configure :production do
  #   use Rack::SslEnforcer
  #   use SecureHeaders::Middleware
  #   # Against CSRF (requires `disable :protection` before `use Rack::Session::...`)
  #   use Rack::Protection, reaction: :drop_session
  # end
  before do
    # Validation of authenticated user
    puts request.path_info
    if session[:current_user] || request.path_info == '/login'
    #  @current_user = SecureMessage.decrypt(session[:current_user])
    #   @auth_token = session[:auth_token]
    #   puts @current_user
    #   puts session[:auth_token]
      @current_user = session[:current_user]
    else
      redirect :login
    end
  end

  def login_account(authorized_account)
    @current_user = authorized_account['data']['user']
    session[:auth_token] = authorized_account['data']['auth_token']
    session[:current_user] = SecureMessage.encrypt(@current_user)
    # flash[:notice] = "Welcome back #{@current_user['username']}"
  end


  get '/event_dashboard' do
    erb :event_dashboard
  end

  get '/new_event' do
    erb :new_event
  end


  # post '/api/v1/user/:id/event' do
  #   event = _get_body_of_request
  #   participants =
  #   CreateEvent.call(user: params[:id], event: event, participants:)
  # end

end
