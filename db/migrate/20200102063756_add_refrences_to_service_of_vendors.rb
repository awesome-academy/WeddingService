class AddRefrencesToServiceOfVendors < ActiveRecord::Migration[5.2]
  def change
    add_reference :service_of_vendors, :vendor, foreign_key: true
    add_reference :service_of_vendors, :service, foreign_key: true
  end
end
