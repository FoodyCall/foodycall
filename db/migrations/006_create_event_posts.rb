require 'sequel'

Sequel.migration do
  change do
    create_table(:event_posts) do
      primary_key :id
      Integer :user_id
      Integer :event_id
      String :post
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
