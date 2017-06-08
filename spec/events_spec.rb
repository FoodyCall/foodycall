require_relative 'spec_helper'
require 'json'

describe 'Test events services class' do
  before do
    User.dataset.delete
    Event.dataset.delete
  end
  it 'should create an event' do
    # This should create a user and create a event for that user as a host
    new_user = {
      firstName: "Pola",
      lastName: "PinPita",
      email: "polap@pinpita.com",
      birthday: "1990/07/12",
      country: "Thailand",
      city: "Bangcook",
      password: "123456",
      img_path: ""
    }
    new_event = {
      name: "Thai Thai food",
      location: "Hsinchu",
      date: "2017/07/31",
      img_path: ""
    }

    user = CreateUser.call(new_user)
    user.add_event(new_event)
    user.events.wont_be_nil
  end

  it 'should retrieve a list of events' do
    events = RetrieveEvents.call()
    events.size > 0
  end

  it 'shoudl retrieve a list of events by filter' do
    new_user = {
      firstName: "Pola",
      lastName: "PinPita",
      email: "polap@pinpita.com",
      birthday: "1990/07/12",
      country: "Thailand",
      city: "Bangcook",
      password: "123456",
      rating: 3,
      img_path: ""
    }
    new_event = {
      name: "Thai Thai food",
      location: "Hsinchu",
      date: "2017/07/31",
      chef: 2,
      helper: 1,
      shopper: 0,
      cleaner: 0,
      guest: 0,
      img_path: ""
    }

    user = CreateUser.call(new_user)
    user.add_event(new_event)

    events = RetrieveEvents.call(location: "Hsinchu",rating: nil, roles: ["Chef","helper"])
    puts events
    events.size > 0
  end
end

describe 'Test events api calls' do
  before do
    User.dataset.delete
    Event.dataset.delete
  end
  it 'should create and event using the api call' do
    post '/api/v1/event', new_event
  end

end
