class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :place
      t.string :phone
      t.string :introduction

      t.timestamps
    end
  end
end
