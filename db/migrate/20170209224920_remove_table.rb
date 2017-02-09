class RemoveTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :likes
  end
  add_column :photos, :likes, :integer
end
