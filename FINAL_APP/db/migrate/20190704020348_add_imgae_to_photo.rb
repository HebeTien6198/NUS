class AddImgaeToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_attachment :photos, :image
  end
end
