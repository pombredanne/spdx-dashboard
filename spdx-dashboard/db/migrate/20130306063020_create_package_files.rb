class CreatePackageFiles < ActiveRecord::Migration
  def change
    create_table :package_files do |t|
      t.integer :package_id
      t.string :name
      t.string :type
      t.string :checksum_id
      t.string :copyright_text
      t.string :copyright_text
      t.string :artifact_name
      t.string :artifact_homepage
      t.string :artifact_uri
      t.string :license_concluded_id
      t.string :license_declared_id

      t.timestamps
    end
  end
end
