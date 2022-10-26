class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :password
      t.integer :authority
      t.string :nickname
      t.integer :level_id

      t.timestamps
    end
  end
end
