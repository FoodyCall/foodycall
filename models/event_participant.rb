require "sequel"
class EventParticipant < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user
  many_to_one :event

  def isApproved?
    approved
  end

  def isShopper?
    shopper
  end

  def isChef?
    chef
  end

  def isHelper?
    helper
  end

  def isGuest?
    guest
  end

  def isCleaner?
    cleaner
  end
end
