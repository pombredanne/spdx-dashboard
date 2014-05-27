class AddChecksumToFile < ActiveRecord::Migration
  def change
    add_column :package_files, :checksum_string, :string
  end
end
