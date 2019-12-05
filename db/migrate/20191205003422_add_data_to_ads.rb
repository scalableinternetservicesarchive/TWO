class AddDataToAds < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :data, :binary
  end
end
