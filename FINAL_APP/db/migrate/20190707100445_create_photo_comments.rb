class CreatePhotoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_comments do |t|
      t.references :Photo, foreign_key: true
      t.references :User, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
