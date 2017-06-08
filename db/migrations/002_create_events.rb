require 'sequel'

Sequel.migration do
  change do
    create_table(:events) do
      primary_key :id
      String :name
      String :location
      String :host_id
      DateTime :date
      String :img_path
      Integer :chef
      Integer :helper
      Integer :shopper
      Integer :cleaner
      Integer :guest
      DateTime :created_at
      DateTime :updated_at
    end

    create_table(:event_participants) do
      String :event_id
      String :user_id
      String :role_id
    end

    create_table(:event_menus) do
      String :event_id
      String :name
      String :type_id
      String :recipe
    end
  end
end
