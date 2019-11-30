class Indexing < ActiveRecord::Migration[6.0]
  def change
    add_index :whatever_chats, :to_user_id
    add_index :whatever_chats, :from_user_id
    add_index :whatever_chats, :original_id
    add_index :comments, :whatever_chat_id
    add_index :votes, :att
    add_index :votes, :whatever_chat_id
  end
end
