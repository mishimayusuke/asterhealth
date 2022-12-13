class AddColumnForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level_name, :string
  end
end
