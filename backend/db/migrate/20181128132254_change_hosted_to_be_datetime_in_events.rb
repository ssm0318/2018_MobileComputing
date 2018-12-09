class ChangeHostedToBeDatetimeInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :hosted, :datetime    
  end
end
