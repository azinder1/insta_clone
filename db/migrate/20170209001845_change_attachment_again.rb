class ChangeAttachmentAgain < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :photos, :photo
    add_attachment :photos, :picture
  end
end
