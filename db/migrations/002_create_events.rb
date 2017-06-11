require 'sequel'

Sequel.migration do
  change do
    create_table(:events) do
      primary_key :id
      String :name, null:false
      String :location, null:false
      Integer :host_id, null:false
      DateTime :date, null:false
      String :img_path
      Integer :chef, null:false
      Integer :helper, null:false
      Integer :shopper, null:false
      Integer :cleaner, null:false
      Integer :guest, null:false
      DateTime :created_at
      DateTime :updated_at
    end

    create_table(:event_menus) do
      Integer :event_id
      String :name
      String :type
      String :recipe
      String :tags
    end

    create_table(:event_participants) do
      Integer :event_id
      Integer :user_id
      FalseClass :chef
      FalseClass :helper
      FalseClass :shopper
      FalseClass :cleaner
      FalseClass :guest
      FalseClass :approved
    end


  end
end
