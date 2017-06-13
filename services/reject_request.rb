require 'json'
# Service object to create event with all attributes
class RejectRequest
  def self.call(event_id:,user_id:)
    reject_request(event_id:event_id,user_id:user_id)
  end

  private_class_method

  def self.reject_request(event_id:,user_id:)
    value = EventParticipant.where(:user_id => user_id, :event_id => event_id).first
    value.delete
  end
end
