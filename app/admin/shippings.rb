ActiveAdmin.register Shipping do
filter :supplier
filter :code
 scope :all, :default => true
  scope :air do |shipping|
    shippings.where(:status => Shipping::STATUS_AIR)
  end

  scope :sea do |shippings|
    shippings.where(:status => Shipping::STATUS_SEA)
  end
  
  form do |f|
    f.inputs "Supplier Info" do
      f.input :supplier, :label => "From"
      f.input :code, :label => "Code Reference"
    end
    f.inputs "Shipment Tracking" do
      f.input :date_send 
      f.input :status, :collection => Shipping.status_collection, :as => :radio
      f.input :forwarder, :collection => [["Choose","Choose"],["JBS","JBS"],["SPEED ACCESS","SPEED ACCESS"],["TONGDA","TONGDA"]], :include_blank => false
    end

    f.inputs "Items" do
      f.has_many :items do |i|
        i.input :quantity
        i.input :_destroy, :as => :boolean, :label => "Delete this item" unless i.object.id.nil?
        i.input :model
        i.input :description
        i.input :amount
      end
    end
    
    #f.inputs "Options" do
    #  f.input :code, :hint => "The Sales Order, should be incremental. Suggested code: ASI-2011-#{Invoice.suggest_code}"
    #  f.input :status, :collection => Invoice.status_collection, :as => :radio
    #  f.input :due_date
    #  f.input :tax, :input_html => { :style => "width: 30px"}, :hint => "This should be a percentage, from 0 to 100 (without the % sign)"
    #  f.input :discount, :input_html => { :style => "width: 30px"}, :hint => "This should be a percentage, from 0 to 100 (without the % sign)"
    #end
    
    #f.inputs "Other Fields" do
    #  f.input :terms, :input_html => { :rows => 4 }, :label => "Terms & Conditions"
    #  f.input :notes, :input_html => { :rows => 4 }
    #end
    
    f.buttons
  end
end
