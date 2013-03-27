class RenameMyColumnByHand < ActiveRecord::Migration
  def self.up
    rename_column :micro_tasks, :task_id, :request_task_id
  end

  def self.down
    rename_column :micro_tasks, :task_id, :request_task_id
  end
end
