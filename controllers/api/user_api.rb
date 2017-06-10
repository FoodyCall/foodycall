require 'json'
require 'active_support/core_ext/hash'
class FoodyCallApp < Sinatra::Base
  #API Calls for users
  post '/api/v1/users/?' do
    begin
      user_data = request.body.read
      user_data = ActiveSupport::HashWithIndifferentAccess.new(JSON(user_data))
      saved_user = CreateUser.call(user_data)
    rescue => e
      logger.info "FAILED to create new user: #{e.inspect}"
      halt 400
    end
    status 201
    saved_user.to_json
  end

  #API Calls for users
  post '/api/v1/users/authenticate/?' do
    begin
      user_data = request.body.read
      user_data = ActiveSupport::HashWithIndifferentAccess.new(JSON(user_data))
      user = AuthenticateUser.call(user_data)
    rescue => e
      logger.info "FAILED to authenticate user: #{e.inspect}"
      halt 401
    end
    status 200
    user.to_json
  end
end
