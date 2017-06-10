class RetrieveEvents
  def self.call(roles:nil, rating:nil, location:nil)
    if roles != nil || rating != nil || location != nil
      retrieve_filtered_events(roles = roles, rating = rating, location= location)
    else
      retrieve_all_events()
    end
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
      Event.where(filter).all
    end
  end
end
