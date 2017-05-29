class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :id
      t.string :name
      t.string :location
      t.date :date
      t.string :img_path
    end
  end
end
