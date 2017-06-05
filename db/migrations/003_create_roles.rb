require 'sequel'

Sequel.migration do
  def change
    create_table :roles do |t|
      t.string :role_id
      t.string :name
    end
  end
end
