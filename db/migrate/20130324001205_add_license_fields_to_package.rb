class AddLicenseFieldsToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :license_concluded_id, :integer
    add_column :packages, :license_declared, :string
  end
end
