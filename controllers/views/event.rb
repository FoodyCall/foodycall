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
    # Add host role to count
    case params['host-role']
      when 'Chef'
        params['chef-count'] = params['chef-count'].to_i + 1
      when 'Shopper'
        params['shopper-count'] = params['shopper-count'].to_i + 1
      when 'Helper'
        params['helper-count'] = params['helper-count'].to_i + 1
      when 'Cleaner'
        params['cleaner-count'] = params['cleaner-count'].to_i + 1
      when 'Guest'
        params['guest-count'] = params['guest-count'].to_i + 1
    end
    event = CreateEvent.call(
      host_id: @current_user['id'],
      event: {
        name: params['name'],
        location: params['address'],
        country: params['country'],
        city: params['city'],
        date: "#{params['date']} #{params['time']}",
        chef: params['chef-count'].to_i,
        helper: params['helper-count'].to_i,
        shopper: params['shopper-count'].to_i,
        cleaner: params['cleaner-count'].to_i,
        guest: params['guest-count'].to_i,
        img_path: ""
      }
    )
    join = JoinEvent.call(
      event_id: event.id,
      user_id: @current_user['id'],
      roles: [params['host-role']],
      message: ''
    )

   if event && join
    flash[:info] = "Event Created. Waiting for participants"
  else
    flash[:error] = "Error creating. Please check the fields and try again."
   end

    redirect '/'

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
