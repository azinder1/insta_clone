class AddPhotoAttachment < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :photo_path
    add_attachment :photos, :photo_path
  end
end
