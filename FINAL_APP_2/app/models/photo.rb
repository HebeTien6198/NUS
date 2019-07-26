class Photo < ApplicationRecord
  belongs_to :user
  enum sharing_mode: [:is_private, :is_public, :is_album]
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  has_many :album_records, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  # Ta cũng có thể gộp 3 điều kiện trên:
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', "image/jpg"]
  validates_attachment :image, presence: true,
  size: { in: 0..10000.kilobytes }
end
