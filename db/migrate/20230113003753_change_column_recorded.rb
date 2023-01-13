class ChangeColumnRecorded < ActiveRecord::Migration[6.1]
  def change
    change_column :records,:recorded,:string
  end
end
