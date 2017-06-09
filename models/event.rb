require "sequel"
class Event < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user, :key=>:host_id
  one_to_many :event_participants

  def to_json(options = {})
    JSON({
        name: name,
        location: location,
        date: date,
        host:{},
        chef:
        helper:
        shopper:
        cleaner:
        guest:
        participants: []
        menu:[]
      },options)
  end
end
