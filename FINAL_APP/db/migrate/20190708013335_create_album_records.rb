class CreateAlbumRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :album_records do |t|
      t.references :Photo, foreign_key: true
      t.references :Album, foreign_key: true

      t.timestamps
    end
  end
end
