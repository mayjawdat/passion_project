class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.references :cat, null: false

      t.timestamps
    end
  end
end
