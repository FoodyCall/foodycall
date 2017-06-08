require_relative 'spec_helper'
require 'json'

describe 'Test events services class' do
  it 'should create an event' do
    # This should create a user and create a event for that user as a host

    new_event = {
      name: "Thai Thai food",
      location: "Hsinchu",
      host: "",
      date: "2017/07/31",
      img_path: ""
    }

  end
end

describe 'Test events api calls' do
end
