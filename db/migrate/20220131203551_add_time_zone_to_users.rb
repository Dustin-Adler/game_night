class AddTimeZoneToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :location, :time_zone
  end
end
