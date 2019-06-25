class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :book, foreign_key: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
