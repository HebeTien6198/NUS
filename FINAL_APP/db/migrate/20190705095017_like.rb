class Like < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :User, foreign_key: true
      t.references :Photo, foreign_key: true
    end
  end
end
