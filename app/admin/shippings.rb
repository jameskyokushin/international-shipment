ActiveAdmin.register Shipping do

#show :title => :supplier do
#    panel "Supplier Details" do
#      attributes_table_for supplier do
        #row("Name") { supplier.name }
        #row("Status") { status_tag invoice.status, invoice.status_tag }
        #row("Issue Date") { invoice.created_at }
        #row("Due Date") { invoice.due_date }
#      end
#    end
    
#    panel "Items" do
#      table_for supplier.items do |t|
#        t.column("Qty.") { |item| number_with_delimiter item.quantity }
#        t.column("Description") { |item| item.description }
#        t.column("Per Unit") { |item| number_to_currency item.amount }
#        t.column("Total") { |item| number_to_currency item.total}
        
        # Show the tax, discount, subtotal and total
        #tr do
        #  2.times { td "" }
        #  td "Discount:", :style => "text-align:right; font-weight: bold;"
        #  td "#{number_with_delimiter(invoice.discount)}%"
        #end
        
        #tr do
        #  2.times { td "" }
        #  td "Sub-total:", :style => "text-align:right; font-weight: bold;"
        #  td "#{number_to_currency(invoice.subtotal)}%"
        #end
        
        #tr do
        #  2.times { td "" }
        #  td "Taxes:", :style => "text-align:right; font-weight: bold;"
        #  td "#{number_to_currency(invoice.taxes)} (#{number_with_delimiter(invoice.tax)}%)"
        #end
        
        #tr do
        #  2.times { td "" }
        #  td "Total:", :style => "text-align:right; font-weight: bold;"
        #  td "#{number_to_currency(invoice.total)}%", :style => "font-weight: bold;"
        #end
    #  end
    #end
 # end
  form do |f|
    f.inputs "Supplier Info" do
      f.input :supplier, :label => "From"
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