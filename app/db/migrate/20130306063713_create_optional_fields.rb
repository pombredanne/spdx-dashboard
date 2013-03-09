class CreateOptionalFields < ActiveRecord::Migration
  def change
    create_table :optional_fields do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :field_name
      t.text :field_data

      t.timestamps
    end
  end
end
