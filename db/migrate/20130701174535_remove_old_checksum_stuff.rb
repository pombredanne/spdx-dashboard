class RemoveOldChecksumStuff < ActiveRecord::Migration
  def up
    remove_column :packages, :checksum_id
    drop_table :checksums
  end

  def down
    add_column :packages, :checksum_id, :integer
    create_table :checksums do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :algorithm
      t.string :value

      t.timestamps
    end
  end
end
