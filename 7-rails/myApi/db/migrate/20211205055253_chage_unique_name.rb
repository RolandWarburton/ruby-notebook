class ChageUniqueName < ActiveRecord::Migration[5.1]
  def change
    remove_column :robots, :name, :string
    add_column :robots, :name, :string
    add_index :robots, :name, unique: true
  end
end
