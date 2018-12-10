class CreateEventAttendings < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendings do |t|
      t.belongs_to      :event, null: false
      t.belongs_to      :user, null: false

      t.timestamps
    end
  end
end
