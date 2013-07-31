class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :name
      t.text :users
      t.text :nodes

      t.timestamps
    end
  end
end
