class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.belongs_to  :recipient, null: false, foreign_key: { to_table: :users }
      t.belongs_to  :actor, null: false, foreign_key: { to_table: :users }
      t.datetime    :read_at
      t.integer     :target_id
      t.string      :target_type
      t.string      :action

      # reference: http://aalvarez.me/blog/posts/easy-notification-system-in-rails.html 참조

      t.timestamps
    end
  end
end
