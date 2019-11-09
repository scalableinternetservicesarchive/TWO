class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :postid
      t.integer :userid
      t.string :alias
      t.string :body

      t.timestamps
    end
  end
end
