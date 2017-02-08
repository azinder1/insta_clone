class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :profile_photo, :string

      t.timestamps
    end

    create_table :photos do |t|
      t.column :user_id, :integer
      t.column :photo_path, :string
      t.column :description, :string

      t.timestamps
    end

    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :photo_id, :integer
      t.column :text, :string

      t.timestamps
    end
  end
end
