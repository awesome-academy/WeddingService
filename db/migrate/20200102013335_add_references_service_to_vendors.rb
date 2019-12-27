class AddReferencesServiceToVendors < ActiveRecord::Migration[5.2]
  def change
    add_reference :vendors, :service, foreign_key: true
  end
end
