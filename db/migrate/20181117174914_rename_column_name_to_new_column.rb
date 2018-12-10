class RenameColumnNameToNewColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :longitude, :event_longitude
    rename_column :events, :latitude, :event_latitude
    rename_column :profiles, :longitude, :profile_longitude
    rename_column :profiles, :latitude, :profile_latitude
    add_index     :events, [:event_longitude, :event_latitude]
    add_index     :profiles, [:profile_longitude, :profile_latitude]
  end
end
