class AddReferencesScheduleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :schedule, foreign_key: true
  end
end
