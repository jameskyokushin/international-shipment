ActiveAdmin.register Shipping do

#=================================================================================
# SHow View
  show :title => :code do
    panel "Suppliers" do
      attributes_table_for shipping.supplier do
        row("Supplier Name") { shipping.supplier }
        
      end
    end
    panel "Items" do
      table_for shipping.items do |t|
       t.column("Qty.") { |item| number_with_delimiter item.quantity }
       t.column("Model.") { |item| item.model  }
       t.column("Description.") { |item| item.description  }
       #t.column("Unit Price.") { |item| number_to_currency item.amount }
      end
    end
    panel "Shipment Tracking" do
      attributes_table_for shipping do
        row("Date Send") { shipping.date_send }
        row("Recieved By") { shipping.recieve_by }
        row("By") { shipping.status }
        row("Forwarder") { shipping.forwarder }
        row("Estimated Time/Date Departure") {  shipping.pinadala }
        row("Estimated Time/Date Arrival") {  shipping.darating }
      end
    end
  end

filter :supplier
filter :code
  scope :all, :default => true
  scope :air do |shippings|
    shippings.where(:status => Shipping::STATUS_AIR)
  end

  scope :sea do |shippings|
    shippings.where(:status => Shipping::STATUS_SEA)
  end
#=================================================================================================
# Index View
  index do
    column :code
    column :supplier
    column :forwarder
    column :date_send
    column "Estimated Time Of Arrival" do |shipping|
      eta = if shipping.darating
        " (ETA in #{distance_of_time_in_words Time.now, shipping.darating})"
      else
        ""
      end
      
      "#{l shipping.created_at, :format => :short}" + eta
    end
    column do |shipping|
      link_to("Details", admin_shipping_path(shipping)) + " | " + \
      link_to("Edit", edit_admin_shipping_path(shipping)) + " | " + \
      link_to("Delete", admin_shipping_path(shipping), :method => :delete, :confirm => "Are you sure?")
    end
  end
#=================================================================================================
# Form View
  form do |f|
    f.inputs "Supplier Info" do
      f.input :supplier, :label => "From"
      f.input :code, :input_html => { :style => "width: 150px"}, :label => "PI #"
    end

    f.inputs "ALL ITEMS" do
      f.has_many :items do |i|
        i.input :quantity, :input_html => { :style => "width: 40px"}
        i.input :_destroy, :as => :boolean, :label => "Delete this item" unless i.object.id.nil?
        i.input :model, :input_html => { :style => "width: 200px"}
        i.input :description
      end
    end

    f.inputs "Shipment Tracking" do
      f.input :date_send 
      f.input :status, :collection => Shipping.status_collection, :as => :radio, :label => "BY:"
      f.input :forwarder, :collection => [["Choose","Choose"],["JBS","JBS"],["SPEED ACCESS","SPEED ACCESS"],["TONGDA","TONGDA"]], :include_blank => false
      f.input :pinadala, :label => "Estimated Date/Time of Departure"
      f.input :darating,  :label => "Estimated Date/Time of Arival (Manila)"
      f.input :declared_value
      f.input :recieve_by 
    end
    f.buttons
  end
end
