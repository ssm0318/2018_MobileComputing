class RemoveReviewedFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :reviewed, :boolean
  end
end
