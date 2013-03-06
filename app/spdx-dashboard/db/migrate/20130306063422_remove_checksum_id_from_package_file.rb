class RemoveChecksumIdFromPackageFile < ActiveRecord::Migration
  def up
    remove_column :package_files, :checksum_id
  end

  def down
    add_column :package_files, :checksum_id, :integer
  end
end
