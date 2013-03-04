class CreateSpdxDocs < ActiveRecord::Migration
  def change
    create_table :spdx_docs do |t|
      t.string :spec_version
      t.string :data_license
      t.integer :comment_id

      t.timestamps
    end
  end
end
