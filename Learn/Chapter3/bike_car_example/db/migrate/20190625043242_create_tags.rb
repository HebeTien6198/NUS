class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :taggable, polymorphic: true

      t.timestamps
    end
  end
end
