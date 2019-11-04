class CreateWhateverChats < ActiveRecord::Migration[6.0]
  def change
    create_table :whatever_chats do |t|

      t.timestamps
    end
  end
end
