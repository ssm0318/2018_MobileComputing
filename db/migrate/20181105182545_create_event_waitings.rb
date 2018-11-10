class CreateEventWaitings < ActiveRecord::Migration[5.1]
  def change
    create_table :event_waitings do |t|
      t.belongs_to      :event, null: false
      t.belongs_to      :waiter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
 