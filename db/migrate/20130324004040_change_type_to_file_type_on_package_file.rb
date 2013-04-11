class ChangeTypeToFileTypeOnPackageFile < ActiveRecord::Migration
  def up
    rename_column :package_files, :type, :file_type
  end

  def down
    rename_column :package_files, :file_type, :type
  end
end
