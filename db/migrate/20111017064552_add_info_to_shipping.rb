class AddInfoToShipping < ActiveRecord::Migration
  def self.up
    add_column :shippings, :date_send, :date
    add_column :shippings, :code, :string
    add_column :shippings, :status, :string
  end

  def self.down
    remove_column :shippings, :status
    remove_column :shippings, :code
    remove_column :shippings, :date_send
  end
end
