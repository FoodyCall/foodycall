require 'sequel'

Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :first_name
      String :last_name, null: false
      Date :birthday, null: false
      String :email, null: false, unique: true
      String :country, null: false, unique: true
      String :city, null: false, unique: true
      String :password
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
