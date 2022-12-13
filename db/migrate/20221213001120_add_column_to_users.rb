class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level_stop, :string
  end
end
