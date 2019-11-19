class AddTagsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tags, :string
  end
end
