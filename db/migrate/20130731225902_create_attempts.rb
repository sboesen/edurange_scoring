class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.integer :scenario_id
      t.integer :score
      t.text :hosts

      t.timestamps
    end
  end
end
