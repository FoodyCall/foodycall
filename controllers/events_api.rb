require 'json'
require 'active_support/core_ext/hash'
class FoodyCallApp < Sinatra::Base
  #API Calls for users
  post '/api/v1/users/:id/events/?' do
    begin
      id = params[:id]
      event_data = request.body.read
      event_data = ActiveSupport::HashWithIndifferentAccess.new(JSON(event_data))
      puts event_data
      saved_event = CreateEvent.call(host_id:id,event:event_data)
    rescue => e
      puts "Error"
      puts e
      logger.info "FAILED to create new event: #{e.inspect}"
      halt 400
    end
    status 201
    saved_event.to_json
  end
end
