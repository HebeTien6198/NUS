class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :old_column, :new_column
  end
end
