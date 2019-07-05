class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :des
      t.references :User, foreign_key: true
      t.integer :sharingMode

      t.timestamps
    end
  end
end
