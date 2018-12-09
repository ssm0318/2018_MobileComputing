class RemoveProfileFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tags, :profile, foreign_key: true
    add_reference     :tags, :event, index: true, foreign_key: true
  end
end
