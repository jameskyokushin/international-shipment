class CreateTrackingShipments < ActiveRecord::Migration
  def self.up
    create_table :tracking_shipments do |t|
      t.integer :supplier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tracking_shipments
  end
end
