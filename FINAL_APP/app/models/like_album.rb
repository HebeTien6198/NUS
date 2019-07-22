class LikeAlbum < ApplicationRecord
  belongs_to :User
  belongs_to :Album
end
