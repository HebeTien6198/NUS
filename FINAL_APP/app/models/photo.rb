class Photo < ApplicationRecord
  belongs_to :User
  has_many :likes
  has_many :photo_comments
  has_many :album_records
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  enum sharingMode: [:isPrivate, :isPublic]

  # Ta cũng có thể gộp 3 điều kiện trên:
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', "image/jpg"]
 validates_attachment :image, presence: true,
 size: { in: 0..10000.kilobytes }
end
