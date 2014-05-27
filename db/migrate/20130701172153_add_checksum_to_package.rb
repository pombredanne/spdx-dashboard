class AddChecksumToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :checksum, :string
    add_column :packages, :checksum_algorithm, :string
  end
end
