class AddReferencesServiceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :service, foreign_key: true
  end
end
