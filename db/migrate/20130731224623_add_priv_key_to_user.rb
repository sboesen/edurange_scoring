class AddPrivKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :private_key, :string
  end
end
