class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :postid, :whatever_chat_id
  end
end
