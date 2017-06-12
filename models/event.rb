require "sequel"
class Event < Sequel::Model
  plugin :timestamps, update_on_create: true
  many_to_one :user, :key=>:host_id
  one_to_many :event_menus
  one_to_many :event_participants
  one_to_many :event_discussions

  def host
    user
  end

  def user_joined?(user_id)
    isJoined = !EventParticipant.where(:event_id => id, :user_id => user_id).empty?
    isJoined
  end


  def totalParticipants
    chef + helper + shopper + cleaner + guest
  end


  def participants
    result = []
    event_participants.each do |member|
      result.push(member)
    end
    result
  end

  def approved
    result = []
    event_participants.each do |member|
      if member.isApproved?
        result.push(member)
      end
    end
    result
  end

  def approved_shopper
    result = []
    event_participants.each do |member|
      if member.isApproved? && member.isShopper?
        result.push(member)
      end
    end
    result
  end

  def approved_chef
    result = []
    event_participants.each do |member|
      if member.isApproved? && member.isChef?
        result.push(member)
      end
    end
    result
  end

  def approved_helper
    result = []
    event_participants.each do |member|
      if member.isApproved? && member.isHelper?
        result.push(member)
      end
    end
    result
  end
  def approved_guest
    result = []
    event_participants.each do |member|
      if member.isApproved? && member.isGuest?
        result.push(member)
      end
    end
    result
  end
  def approved_cleaner
    result = []
    event_participants.each do |member|
      if member.isApproved? && member.isCleaner?
        result.push(member)
      end
    end
    result
  end


  def approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved?
        count+=1
      end
    end
    count
  end

  def shopper_approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved? && member.isShopper?
        count+=1
      end
    end
    count
  end

  def helper_approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved? && member.isHelper?
        count+=1
      end
    end
    count
  end

  def chef_approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved? && member.isChef?
        count+=1
      end
    end
    count
  end

  def guest_approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved? && member.isGuest?
        count+=1
      end
    end
    count
  end

  def cleaner_approved_count
    count = 0
    event_participants.each do |member|
      if member.isApproved? && member.isCleaner?
        count+=1
      end
    end
    count
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
