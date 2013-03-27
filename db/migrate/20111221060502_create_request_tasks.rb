class CreateRequestTasks < ActiveRecord::Migration
  def change
    create_table :request_tasks do |t|
      t.string :from
      t.string :to
      t.float :budget
      t.text :translation_text
      t.text :translated_text
      t.integer :requester_id

      t.timestamps
    end
  end
end
