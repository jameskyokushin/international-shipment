class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :quantity
      t.string :model
      t.string :description
      t.float :amount
      t.integer :shipping_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
