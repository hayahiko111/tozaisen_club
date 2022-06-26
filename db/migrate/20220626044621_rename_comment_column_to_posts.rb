class RenameCommentColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :comment, :message
  end
end
