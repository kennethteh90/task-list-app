class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.datetime :due_date
      t.integer :task_list_id, foreign_key: true
      t.timestamps
    end
  end
end
