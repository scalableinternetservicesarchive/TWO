class AddOriginalIdToWhateverChats < ActiveRecord::Migration[6.0]
  def change
    add_column :whatever_chats, :original_id, :int, :default => 0
  end
end
