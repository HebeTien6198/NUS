class AddLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :LastName, :string
  end
end
