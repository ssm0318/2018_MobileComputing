class AddProfileTagRawToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :profile_tag_raw, :string
  end
end
