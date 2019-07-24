class AddSharingModeToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :sharing_mode, :integer
  end
end
