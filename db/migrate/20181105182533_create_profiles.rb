class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to      :user, null: false
      t.string          :name
      t.integer         :age
      t.text            :description
      t.references      :tag, index: true, foreign_key: true
      t.string          :address
      t.float           :longitude
      t.float           :latitude
      t.boolean         :isVerified

      t.timestamps
    end
  end
end
