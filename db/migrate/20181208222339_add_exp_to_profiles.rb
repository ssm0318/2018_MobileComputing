class AddExpToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :exp, :integer
  end
end
