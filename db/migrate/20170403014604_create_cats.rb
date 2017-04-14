class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age
      t.string :breed
      t.string :photo_source

      t.timestamps
    end
  end
end
