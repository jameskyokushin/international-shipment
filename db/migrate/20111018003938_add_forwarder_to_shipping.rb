class AddForwarderToShipping < ActiveRecord::Migration
  def self.up
    add_column :shippings, :forwarder, :string
  end

  def self.down
    remove_column :shippings, :forwarder
  end
end
