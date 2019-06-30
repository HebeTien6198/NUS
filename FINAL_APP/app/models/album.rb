class Album < ApplicationRecord
    belongs_to :User
    has_many :photos, as: :image

    validates :name,
            presence: true,
            length: {minimum:2, maximum:20}

 
  
end
