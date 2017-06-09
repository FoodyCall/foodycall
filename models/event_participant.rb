require "sequel"
class EventParticipant < Sequel::Model
  many_to_one :user
  many_to_one :role
  many_to_one :event
end
