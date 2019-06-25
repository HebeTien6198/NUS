class Car < ApplicationRecord
    has_many :tags, as: :taggable
end
