class Photo < ApplicationRecord
  enum sharingMode: [:isPrivate, :isPublic,]
  belongs_to :User
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

   # Ta cũng có thể gộp 3 điều kiện trên:
 validates_attachment :image, presence: true,
 size: { in: 0..10000.kilobytes }

 validates_attachment_content_type :image, content_type: ["image/png", "image/jpeg", "image/jpg"]

# content_type: { content_type: "image/png"  }
end
