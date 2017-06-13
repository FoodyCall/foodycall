require 'rack-flash'
require 'json'
require 'http'
class FoodyCallApp < Sinatra::Base

  get '/dashboard/:id' do
    @user = @current_user
    @event = RetrieveEvents.id(params[:id])
    @posts = RetrievePost.call(event_id: params[:id])
    @pending_request = RetriveParticipantRequest.call(event_id: params[:id])
    erb :event_dashboard
  end

  get '/dashboard' do
    @user_id = @current_user['id']
    @events = RetrieveEvents.call()
    @events_host = RetrieveEvents.events_host(user_id:@user_id)
    @events_join = RetrieveEvents.events_joined(user_id:@user_id)
    @events_pending = RetrieveEvents.events_pending(user_id:@user_id)

    erb :dashboard
  end

  post '/post' do

    user_id = @current_user['id']
    event_id = params[:event_id]
    post = params[:post]

    post = CreateEventPost.call(
      user_id: user_id,
      event_id:event_id,
      post: post
    )

    halt 201
  end

  post '/approve' do

    post = ApproveRequest.call(
      user_id: params[:user_id],
      event_id:params[:event_id]
    )

    halt 201

  end

  post '/reject' do

    post = RejectRequest.call(
      user_id: params[:user_id],
      event_id:params[:event_id]
    )

    halt 201

  end

end
