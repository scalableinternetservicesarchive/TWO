class AddFieldsToWhateverChat < ActiveRecord::Migration[6.0]
  def change
    add_column :whatever_chats, :title, :string
    add_column :whatever_chats, :body, :string
    add_column :whatever_chats, :to_user_id, :string
    add_column :whatever_chats, :from_user_id, :string
    add_column :whatever_chats, :alias, :string
  end
end
