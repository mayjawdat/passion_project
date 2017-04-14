class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age
      t.string :breed
      t.string :photo_source
      t.boolean :available, default: true
      t.references :order, default: nil

      t.timestamps
    end
  end
end
