class ChangeColumnRecord < ActiveRecord::Migration[6.1]
  def change
    change_column :records,:recorded,:integer
  end
end
