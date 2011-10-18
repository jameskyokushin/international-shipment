class AddOverallToShipping < ActiveRecord::Migration
  def self.up
    add_column :shippings, :declared_value, :string
  end

  def self.down
    remove_column :shippings, :declared_value
  end
end
