class AddDocumentCommentToSpdxDoc < ActiveRecord::Migration
  def change
    add_column :spdx_docs, :document_comment, :text
  end
end
