class RemoveServiceFormVendors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :vendors, :service, index: true, foreign_key: true
  end
end
