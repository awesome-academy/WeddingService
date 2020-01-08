class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :describle
      t.datetime :time

      t.timestamps
    end
  end
end
