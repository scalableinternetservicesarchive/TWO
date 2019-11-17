class AddTagsToWhateverChats < ActiveRecord::Migration[6.0]
  def change
    add_column :whatever_chats, :tags, :string
  end
end
