class AddReferenceScheduleToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :schedule, foreign_key: true
  end
end
