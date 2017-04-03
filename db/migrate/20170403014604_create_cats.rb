class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age
      t.string :breed

      t.timestamps
    end
  end
end
