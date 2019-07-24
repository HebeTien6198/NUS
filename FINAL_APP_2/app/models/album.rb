class Album < ApplicationRecord
  belongs_to :user
  enum sharing_mode: [:is_private, :is_public]
  has_many :album_records, dependent: :destroy
  
end
