class Album < ApplicationRecord
  belongs_to :User
  has_many :photos, as: :image
end
