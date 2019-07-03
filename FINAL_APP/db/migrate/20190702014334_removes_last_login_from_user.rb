class RemovesLastLoginFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :lastLogin, :date
  end
end
