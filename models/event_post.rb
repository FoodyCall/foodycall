require "sequel"
class EventPost < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user
  many_to_one :event
end
