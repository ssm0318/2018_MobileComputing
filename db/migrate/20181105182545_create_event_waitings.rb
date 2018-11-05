class CreateEventWaitings < ActiveRecord::Migration[5.1]
  def change
    create_table :event_waitings do |t|

      t.timestamps
    end
  end
end
