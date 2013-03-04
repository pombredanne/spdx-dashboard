class CreateSpdxDocs < ActiveRecord::Migration
  def change
    create_table :spdx_docs do |t|
      t.string :spec_version
      t.integerdata_license :comment_id

      t.timestamps
    end
  end
end
