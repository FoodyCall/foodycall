require 'sequel'

Sequel.migration do
  def change
    create_table :users do |t|
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
