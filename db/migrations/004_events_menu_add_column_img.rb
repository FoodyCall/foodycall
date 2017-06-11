require 'sequel'
Sequel.migration do
  up do
    add_column :event_menus, :img_path, String
    from(:event_menus).update(:img_path=>'')
  end
end
