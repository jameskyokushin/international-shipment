ActiveAdmin.register Supplier do
  
  filter :name
  filter :email
  
  form do |f|
    f.inputs "Supplier Information" do
      f.input :name, :label => "Company Name"
      f.input :address, :label => "Company Address"
      f.input :phone, :label => "Contact Number"
      f.input :email, :label => "Email"
      end
      f.buttons
    end
  
  index do
    column :name
    column :email do |supplier|
      if supplier.email 
        mail_to supplier.email, supplier.email 
      else 
        "-"
      end
    end
    column :address do |supplier|
      truncate supplier.address
    end
    column :phone
    column do |supplier|
      link_to("Details", admin_supplier_path(supplier)) + " | " + \
      link_to("Edit", edit_admin_supplier_path(supplier)) + " | " + \
      link_to("Delete", admin_supplier_path(supplier), :method => :delete, :confirm => "Are you sure?")
    end
  end
  
  show :title => :name do
    panel "Client Details" do
      attributes_table_for supplier do
        row("Name") { supplier.name }
        row("Email") { mail_to supplier.email }
        row("Address") { supplier.address }
        row("Phone") { supplier.phone }
      end
    end
  end

  
end
