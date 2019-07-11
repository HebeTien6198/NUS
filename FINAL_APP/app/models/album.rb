class Album < ApplicationRecord
    belongs_to :User
    enum sharingMode: [:isPrivate, :isPublic]
    # has_many :photos, as: :image
    has_many :album_records
    # validates :name,
    #         presence: true,
    #         length: {minimum:2, maximum:20}

 
  
end
