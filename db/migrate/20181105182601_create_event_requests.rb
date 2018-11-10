class CreateEventRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :event_requests do |t|
      t.belongs_to      :event, null: false
      t.belongs_to      :requester, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
