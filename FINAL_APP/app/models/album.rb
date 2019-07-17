class Album < ApplicationRecord
    belongs_to :User
    
    # has_many :photos, as: :image, dependent: :destroy
    has_many :album_records, dependent: :destroy
    enum sharingMode: [:isPrivate, :isPublic]
    # validates :name,
    #         presence: true,
    #         length: {minimum:2, maximum:20}

 
  
end
