require 'json'
# Service object to create event with all attributes
class CreateEventPost
  def self.call(user_id:,event_id:,post:)
    create_new_post(user_id: user_id, event_id:event_id,post: post)
  end

  private_class_method

  def self.create_new_post(user_id:,event_id:,post:)
    saved_post = EventPost.new(
      user_id: user_id,
      event_id: event_id,
      post: post
    ).save
    saved_post
  end
end
