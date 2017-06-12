require 'json'
# Service object to create event with all attributes
class RetriveParticipantRequest
  def self.call(event_id:)
    event_pending_request(event_id:event_id)
  end

  private_class_method

  def self.event_pending_request(event_id:)
    EventParticipant.where(:event_id => event_id, :approved => false)
  end
end
