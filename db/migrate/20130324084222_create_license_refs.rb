class CreateLicenseRefs < ActiveRecord::Migration
  def change
    create_table :license_refs do |t|
      t.integer :license_id
      t.integer :spdx_id

      t.timestamps
    end
  end
end
