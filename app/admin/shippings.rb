ActiveAdmin.register Shipping do

  form do |f|
    f.inputs "Supplier Info" do
      f.input :supplier
    end
    
    #f.inputs "Items" do
    #  f.has_many :items do |i|
    #    i.input :_destroy, :as => :boolean, :label => "Delete this item" unless i.object.id.nil?
    #    i.input :quantity
    #    i.input :description
    #    i.input :amount
    #  end
    #end
    
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
