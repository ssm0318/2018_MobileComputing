class CreateJoinTableProfilesTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :profiles, :tags do |t|
      t.index [:profile_id, :tag_id]
      t.index [:tag_id, :profile_id]
    end
  end
end
