class RenameTaskIdFromMicroTasksToRequestTaskId < ActiveRecord::Migration
  def change
    rename_column :micro_tasks, :task_id, :request_task_id
  end
end
