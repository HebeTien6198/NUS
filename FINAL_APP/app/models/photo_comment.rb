class PhotoComment < ApplicationRecord
  belongs_to :Photo
  belongs_to :User
end
