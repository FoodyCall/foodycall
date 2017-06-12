require 'json'
# Service object to create event with all attributes
class JoinEvent
  def self.call(user_id:,event_id:,roles:,message:)
    #Check if user is host
    join_event(user_id: user_id,event_id:event_id,roles:roles,message: message)
  end

  private_class_method

  def self.join_event(user_id:,event_id:,roles:,message:)
    event = Event.where(:id => event_id).first
    isHost = (event.host.id == user_id)? true : false
    join_event = EventParticipant.new(
      event_id: event_id,
      user_id: user_id,
      message: message,
      chef: (roles.include?("Chef")? true : false),
      helper: (roles.include?("Helper")? true : false),
      shopper: (roles.include?("Shopper")? true : false),
      cleaner: (roles.include?("Cleaner")? true : false),
      guest: (roles.include?("Guest")? true : false),
      approved: isHost
    )
    join_event.save
  end
end
