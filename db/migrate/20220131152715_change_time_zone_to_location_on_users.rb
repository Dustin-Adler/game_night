class ChangeTimeZoneToLocationOnUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :time_zone, :location
  end
end
