class RenameFilenameColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :filename, :mail
  end
end
