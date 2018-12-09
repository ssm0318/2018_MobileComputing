class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.belongs_to     :user, null: false
      t.belongs_to     :event, null: false

      t.timestamps
    end
  end
end
