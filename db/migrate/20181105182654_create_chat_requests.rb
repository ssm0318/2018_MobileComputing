class CreateChatRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_requests do |t|

      t.timestamps
    end
  end
end
