class CreateEventRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :event_requests do |t|

      t.timestamps
    end
  end
end
