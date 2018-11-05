class CreateEventAttendings < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendings do |t|

      t.timestamps
    end
  end
end
