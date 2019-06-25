class Photo < ApplicationRecord
  belongs_to :image, polymorphic: true
end
