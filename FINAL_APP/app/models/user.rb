class User < ApplicationRecord
    has_many :photos, as: :image
    has_many :albums
end
