class CreateJoinTableProfileTagsProfiles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :profile_tags, :profiles do |t|
      t.index [:profile_tag_id, :profile_id]
      t.index [:profile_id, :profile_tag_id]
    end
  end
end
