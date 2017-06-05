require 'sequel'

Sequel.migration do
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :name
      t.string :location
      t.string :host
      t.date :date
      t.string :img_path
    end

    create_table :event_participants do |t|
      t.string :event_id
      t.string :user_id
      t.string :role_id
    end

    create_table :event_menus do |t|
      t.string :event_id
      t.string :name
      t.string :type_id
      t.string :recipe
    end
  end
end
