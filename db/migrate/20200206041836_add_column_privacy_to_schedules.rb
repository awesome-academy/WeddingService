class AddColumnPrivacyToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :privacy, :string, default: "public"
  end
end
