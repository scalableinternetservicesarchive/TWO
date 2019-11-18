class ChangeVoteColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :postid, :whatever_chat_id
  end
end
