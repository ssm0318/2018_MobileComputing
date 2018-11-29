class RemoveEventIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :event_id, :int
  end
end
