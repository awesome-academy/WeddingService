class AddVendorToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :service_of_vendor, foreign_key: true
  end
end
