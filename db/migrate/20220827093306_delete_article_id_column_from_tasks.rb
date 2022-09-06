class DeleteArticleIdColumnFromTasks < ActiveRecord::Migration[7.0]
  def up
    remove_column :tasks, :article_id
  end

  def down
    remove_column :tasks, :article_id
  end
end
