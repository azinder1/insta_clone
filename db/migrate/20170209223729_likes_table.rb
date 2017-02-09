class LikesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.column :user_id, :integer
      t.column :photo_id, :integer
      t.column :total, :integer
    end
  end
end
