require 'json'
# Service object to create event with all attributes
class CreateEvent
  def self.call(host_id:,event:)
    create_new_event(host_id: host_id, event:event)
  end

  private_class_method

  def self.create_new_event(host_id:,event:)
    event = ActiveSupport::HashWithIndifferentAccess.new(event)
    user = User.where(:id => host_id).first
    saved_event = user.add_event(
      name: event[:name],
      location: event[:location],
      date: event[:date],
      chef: event[:chef],
      helper: event[:helper],
      shopper: event[:shopper],
      cleaner: event[:cleaner],
      guest: event[:guest],
      img_path: event[:img_path]
    )
    if event[:menus]!=nil
      event[:menus].each do |menu|
        saved_menu = saved_event.add_event_menu(
          name: menu[:name],
          type: menu[:type],
          tags: menu[:tags].join(','),
          recipe: menu[:recipe]
        )
      end
    end
    saved_event
  end
end
