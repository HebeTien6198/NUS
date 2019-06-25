class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :des
      t.string :url
      t.references :image, polymorphic: true

      t.timestamps
    end
  end
end
