class AddTagRawToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :tag_raw, :string
  end
end
