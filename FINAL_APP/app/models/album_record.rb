class AlbumRecord < ApplicationRecord
  belongs_to :Photo
  belongs_to :Album
end
