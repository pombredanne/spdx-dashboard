class AddAttachmentUploadToSpdxDocs < ActiveRecord::Migration
  def self.up
    change_table :spdx_docs do |t|
      t.attachment :upload
    end
  end

  def self.down
    drop_attached_file :spdx_docs, :upload
  end
end
