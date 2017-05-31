class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.date :birthday
      t.string :country
      t.string :city
      t.string :password
      t.string :img_path
    end
  end
end
