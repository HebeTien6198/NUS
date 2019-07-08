class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :Like, :User_id, :user_id
      rename_column :Like, :Photo_id, :photo_id
    end
  end
end
