class CreateLikeAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :like_albums do |t|
      t.references :Album
      t.references :User

      t.timestamps
    end
  end
end
