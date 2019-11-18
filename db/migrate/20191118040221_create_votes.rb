class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.string :username
      t.integer :postid
      t.integer :type

      t.timestamps
    end
  end
end
