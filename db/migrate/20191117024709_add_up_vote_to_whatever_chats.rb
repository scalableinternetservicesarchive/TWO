class AddUpVoteToWhateverChats < ActiveRecord::Migration[6.0]
  def change
    add_column :whatever_chats, :up_vote, :int, :default => 0
    add_column :whatever_chats, :down_vote, :int, :default => 0
  end
end
