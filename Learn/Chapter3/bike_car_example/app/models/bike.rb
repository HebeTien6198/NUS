class Bike < ApplicationRecord
    has_many :tags, as: :taggable
end
