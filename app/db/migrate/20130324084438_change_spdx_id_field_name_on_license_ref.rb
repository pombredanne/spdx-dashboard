class ChangeSpdxIdFieldNameOnLicenseRef < ActiveRecord::Migration
  def up
    rename_column :license_refs, :spdx_id, :spdx_doc_id
  end

  def down
    rename_column :license_refs, :spdx_doc_id, :spdx_id
  end
end
