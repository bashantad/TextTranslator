class CreateMicroTasks < ActiveRecord::Migration
  def change
    create_table :micro_tasks do |t|
      t.integer :task_id
      t.string :status
      t.float :credit
      t.text :translation_microtask
      t.text :translated_microtask
      t.integer :worker_id

      t.timestamps
    end
  end
end
