class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 7, scale: 2
      t.integer :weight
      t.boolean :in_stock
      t.date :expiration_date

      t.timestamps
    end
  end
end
