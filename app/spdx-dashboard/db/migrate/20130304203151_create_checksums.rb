class CreateChecksums < ActiveRecord::Migration
  def change
    create_table :checksums do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :algorithm
      t.string :value

      t.timestamps
    end
  end
end
