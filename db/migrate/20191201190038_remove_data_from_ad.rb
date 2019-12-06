class RemoveDataFromAd < ActiveRecord::Migration[6.0]
  def change
    remove_column :ads, :data, :binary
  end
end
