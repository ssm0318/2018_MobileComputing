class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to       :event
      t.belongs_to       :host, null: false, foreign_key: { to_table: :users }
      t.belongs_to       :author, null: false, foreign_key: { to_table: :users }
      t.float            :rating
      t.text             :content

      t.timestamps
    end
  end
end
