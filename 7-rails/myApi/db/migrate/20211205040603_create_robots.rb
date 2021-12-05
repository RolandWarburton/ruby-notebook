class CreateRobots < ActiveRecord::Migration[5.1]
  def change
    create_table :robots do |t|
      t.string :name, unique: true
      t.string :profession
      t.boolean :fly

      t.timestamps
    end
  end
end
