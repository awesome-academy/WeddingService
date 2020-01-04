class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
