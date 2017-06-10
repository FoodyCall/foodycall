require 'rack-flash'
class FoodyCallApp < Sinatra::Base
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    #Add validation later
    if params[:user]['password'] != params[:user]['password2']
      flash[:error] = 'Password confirmation not matching'
      halt
    end
  end
end
