class ChangeAttachementName < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :photos, :photo_path
    add_attachment :photos, :photo
  end
end
