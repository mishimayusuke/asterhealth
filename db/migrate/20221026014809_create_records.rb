class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.datetime :recorded
      t.integer :step
      t.integer :rank

      t.timestamps
    end
  end
end
