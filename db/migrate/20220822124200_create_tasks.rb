class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :task_id
      t.text :details

      t.timestamps
    end
  end
end
