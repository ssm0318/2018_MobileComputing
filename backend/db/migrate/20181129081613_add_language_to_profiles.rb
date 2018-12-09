class AddLanguageToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :language, :string
    add_index :profiles, :language
  end
end
