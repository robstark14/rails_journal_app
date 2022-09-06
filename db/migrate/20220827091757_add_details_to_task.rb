class AddDetailsToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :details, :text
  end
end
