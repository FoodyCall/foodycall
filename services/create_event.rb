require 'json'
# Service object to create event with all attributes
class CreateEvent
  def self.call(host_id:,event:)
    create_new_event(host_id: host_id, event:event)
  end

  private_class_method

  def self.create_new_event(host_id:,event:)
    user = User.where(:id => host_id).first
    user.add_event(event)
  end
end
