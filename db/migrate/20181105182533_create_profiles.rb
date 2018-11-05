class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer         :user_id, null: false
      t.string          :name
      t.integer             :age
      t.text            :description
      t.references      :tag, index: true, 

      t.timestamps
    end
  end
end
