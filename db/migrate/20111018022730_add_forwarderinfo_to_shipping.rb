class AddForwarderinfoToShipping < ActiveRecord::Migration
  def self.up
    add_column :shippings, :date_recieve_by_forwarder, :date
    add_column :shippings, :pinadala, :datetime
    add_column :shippings, :darating, :datetime
    add_column :shippings, :recieve_by, :string
    add_column :shippings, :shippment_recieve, :datetime
  end

  def self.down
    remove_column :shippings, :shippment_recieve
    remove_column :shippings, :recieve_by
    remove_column :shippings, :darating
    remove_column :shippings, :pinadala
    remove_column :shippings, :date_recieve_by_forwarder
  end
end
