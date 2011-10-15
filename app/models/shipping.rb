class Shipping < ActiveRecord::Base
  belongs_to :supplier
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :allow_destroy => true
end
