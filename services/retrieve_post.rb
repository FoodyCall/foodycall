class RetrievePost
  def self.call(event_id:)
    retrieve_post(event_id: event_id)
  end


  private_class_method

  def self.retrieve_post(event_id:)
    return EventPost.where(:event_id => event_id).all
  end

end
