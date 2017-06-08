require 'sequel'

Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :first_name, null:false
      String :last_name, null: false
      Date :birthday, null: false
      String :email, null: false, unique: true
      String :country, null: false
      String :city, null: false
      String :password_encrypted, null: false
      Integer :rating,null: true
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
