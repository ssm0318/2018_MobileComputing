class AddMatchScoreToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :match_score, :integer
  end
end
