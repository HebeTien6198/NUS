class Photo < ApplicationRecord
    belongs_to :image, polymorphic: true

    validates :name,
            presence: true,
            length: {minimum:2, maximum:20}
    
    
end
