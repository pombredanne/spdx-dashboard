class AddChecksumToFile < ActiveRecord::Migration
  def change
    add_column :package_files, :checksum, :string
    add_column :package_files, :checksum_algorithm, :string
  end
end
