class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :des
      t.string :numOfPhotos
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
