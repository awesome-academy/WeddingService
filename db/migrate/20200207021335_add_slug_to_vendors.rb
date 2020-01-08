class AddSlugToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :slug, :string
    add_index :vendors, :slug
  end
end
