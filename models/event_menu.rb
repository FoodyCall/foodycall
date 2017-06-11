require "sequel"
class EventMenu < Sequel::Model
  many_to_one :event

  def to_json(options = {})
    JSON({
        name: name,
        type: type,
        tags: tags,
        recipe: recipe,
        img_path: img_path
      },options)
  end
end
