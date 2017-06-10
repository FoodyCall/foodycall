class FoodyCallApp < Sinatra::Base
  get '/signup' do
    erb :signup
  end
end
