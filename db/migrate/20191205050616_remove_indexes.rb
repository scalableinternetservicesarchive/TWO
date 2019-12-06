class RemoveIndexes < ActiveRecord::Migration[6.0]
  def up
    remove_index :whatever_chats, column: :to_user_id
    remove_index :whatever_chats, column: :from_user_id
    remove_index :whatever_chats, column: :original_id
    remove_index :comments, column: :whatever_chat_id
    remove_index :votes, column: :att
    remove_index :votes, column: :whatever_chat_id
  end
end
