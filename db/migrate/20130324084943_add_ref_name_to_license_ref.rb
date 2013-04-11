class AddRefNameToLicenseRef < ActiveRecord::Migration
  def change
    add_column :license_refs, :ref_name, :string
  end
end
