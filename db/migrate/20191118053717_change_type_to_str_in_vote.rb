class ChangeTypeToStrInVote < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :type, :string
  end
end
