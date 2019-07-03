class AddSharingModeToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :sharingMode, :ingeger
  end
end
