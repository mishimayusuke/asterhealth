class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.string :level_name
      t.integer :goal_step

      t.timestamps
    end
  end
end
