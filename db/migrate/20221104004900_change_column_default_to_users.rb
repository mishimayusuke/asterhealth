class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :authority, from: nil, to: "0"
  end
end
