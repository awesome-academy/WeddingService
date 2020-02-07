class AddColumnToSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :privacy
    add_column :schedules, :privacy, :string, default: "professed"
  end
end
