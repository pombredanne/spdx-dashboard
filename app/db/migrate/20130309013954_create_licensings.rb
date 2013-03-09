class CreateLicensings < ActiveRecord::Migration
  def change
    create_table :licensings do |t|
      t.integer :license_id
      t.integer :package_file_id
      t.boolean :conjunctive
      t.boolean :official

      t.timestamps
    end
  end
end
