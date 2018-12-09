class RenameFollow < ActiveRecord::Migration[5.1]
  def change
    rename_column :follows, :followed_id, :following_id
  end
end
 