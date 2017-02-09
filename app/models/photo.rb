class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture, styles: { square: "400x400>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :comments
end
