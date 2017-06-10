require "sequel"
class Event < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user, :key=>:host_id
  one_to_many :event_menus

  def to_json(options = {})
    JSON({
        id: id,
        name: name,
        location: location,
        date: date,
        host: host_id,
        chef: chef,
        helper: helper,
        shopper: shopper,
        cleaner: cleaner,
        guest: guest,
        participants: [],
        menu:[]
      },options)
  end
end
