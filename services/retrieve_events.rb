class RetrieveEvents
  def self.call(roles:nil, rating:nil, location:nil)
    if roles != nil || rating != nil || location != nil
      retrieve_filtered_events(roles = roles, rating = rating, location= location)
    else
      retrieve_all_events()
    end
  end

  def self.events_host(user_id:)
    hosted = User.where(:id => user_id).first.events
    return hosted
  end

  def self.events_joined(user_id:)
    event_not_mine = Event.exclude(:host_id => user_id).all

    events_ids = EventParticipant.where(:user_id => 1 , :event_id => Event.exclude(:host_id => 1).select(:id), :approved => true).get(:event_id)

    joined = Event.where(:id =>events_ids).all
    return joined
  end

  def self.events_pending(user_id:)
    event_not_mine = Event.exclude(:host_id => user_id).all

    events_ids = EventParticipant.where(:user_id => 1 , :event_id => Event.exclude(:host_id => 1).select(:id), :approved => false).get(:event_id)

    pending = Event.where(:id =>events_ids).all
    return pending
  end

  private_class_method

  def self.retrieve_all_events
    return Event.all
  end

  def self.retrieve_filtered_events(roles = nil, rating = nil, location= nil)
    filter = {}
    filter[:rating] = User.where(:rating => rating) if rating != nil
    filter[:location] = location if location != nil
    if roles != nil
      #Convert to sql
      query_roles = roles.map{|rol| "(#{rol.downcase}>0)"}.join('|')
      Event.where(filter){Sequel.lit(query_roles)}.all
    else
      Event.where(filter).eager(:user).all
    end
  end
end
