class AddRelativePathToPackageFile < ActiveRecord::Migration
  def change
    add_column :package_files, :relative_path, :string
  end
end
