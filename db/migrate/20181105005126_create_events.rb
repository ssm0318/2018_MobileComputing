class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer       :host_id, foreign_key: true, null: false
      t.string        :title, null: false
      t.text          :description
      t.string        :location
      t.float         :longitude
      t.float         :latitude
      t.boolean       :hosted
      t.boolean       :reviewed

      t.timestamps
    end
  end
end
