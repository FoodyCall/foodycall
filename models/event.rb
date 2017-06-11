require "sequel"
class Event < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user, :key=>:host_id
  one_to_many :event_menus

  def host
    user
  end

  def totalParticipants
    chef + helper + shopper + cleaner + guest
  end

  def participants
    []
  end

  def joined
    0
  end

  def shopper_joined
    0
  end

  def helper_joined
    0
  end

  def chef_joined
    0
  end

  def guest_joined
    0
  end

  def cleaner_joined
    0
  end

  def menus
    event_menus
  end

  def to_json(options = {})
    JSON({
        id: id,
        name: name,
        location: location,
        date: date,
        host: {
          firstName: user.first_name,
          lastName: user.last_name,
          email: user.email,
          rating: user.rating,
          img: user.img_path
        },
        chef: chef,
        helper: helper,
        shopper: shopper,
        cleaner: cleaner,
        guest: guest,
        totalParticipants: chef + helper + shopper + cleaner + guest,
        participants: [],
        menu:[]
      },options)
  end
end
