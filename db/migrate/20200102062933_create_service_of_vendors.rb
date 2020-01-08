class CreateServiceOfVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :service_of_vendors do |t|
      t.string :describle
      t.timestamps
    end
  end
end
