class AddAttachments < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_photo
    add_attachment :users, :avatar
  end
end
