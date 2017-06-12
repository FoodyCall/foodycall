class RetrieveEventsHost
  def self.call(user_id:)

      retrieve_all_events_host(user_id:user_id)

  end

  private_class_method

  def self.retrieve_events_host(user_id)
    hosted = User.where(:id => user_id).events
    return hosted
  end


end
