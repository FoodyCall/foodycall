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
    puts saved_user.to_json
    saved_user.to_json
  end
end
