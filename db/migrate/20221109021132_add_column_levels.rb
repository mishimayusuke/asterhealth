class AddColumnLevels < ActiveRecord::Migration[6.1]
  def change
    add_column :levels, :level_stop, :string
  end
end
