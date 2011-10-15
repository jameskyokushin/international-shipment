class CreateShippings < ActiveRecord::Migration
  def self.up
    create_table :shippings do |t|
      t.integer :supplier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shippings
  end
end
