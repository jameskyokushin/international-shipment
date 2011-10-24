class Item < ActiveRecord::Base
  belongs_to :shipping
  
  
 
  def total
    self.quantity * self.amount
  end  
end
