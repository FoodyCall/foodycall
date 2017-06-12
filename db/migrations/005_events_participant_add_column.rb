require 'sequel'
Sequel.migration do
  up do
    add_column :event_participants, :message, String
    from(:event_participants).update(:message=>'')
  end
end
