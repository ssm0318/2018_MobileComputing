class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to       :host, null: false, foreign_key: { to_table: :users }
      t.string           :title, null: false
      t.text             :description
      t.string           :location
      t.float            :longitude
      t.float            :latitude
      t.string           :chatlink
      t.boolean          :hosted
      t.boolean          :reviewed
    
      t.timestamps
    end
  end
end
 