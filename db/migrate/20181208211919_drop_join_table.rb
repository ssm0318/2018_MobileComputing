class DropJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :tags, :profiles
  end
end
