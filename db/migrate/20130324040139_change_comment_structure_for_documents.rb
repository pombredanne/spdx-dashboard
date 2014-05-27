class ChangeCommentStructureForDocuments < ActiveRecord::Migration
  def up
    remove_column :spdx_docs, :comment_id
    add_column :spdx_docs, :creator_comment, :text
    add_column :spdx_docs, :generated_at, :datetime
  end

  def down
    add_column :spdx_docs, :comment_id, :integer
    remove_column :spdx_docs, :creator_comment
    remove_column :spdx_docs, :generated_at
  end
end
