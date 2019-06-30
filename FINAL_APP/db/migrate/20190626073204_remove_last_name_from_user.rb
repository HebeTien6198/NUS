class RemoveLastNameFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :LastName, :string
  end
end
