class RenameBodyToNameColumnInTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :body, :name
  end
end
