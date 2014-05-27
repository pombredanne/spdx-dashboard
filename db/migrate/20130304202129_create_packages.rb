class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :spdx_doc_id
      t.string :name
      t.string :filename
      t.string :download_location
      t.integer :checksum_id
      t.text :copyright
      t.string :version
      t.text :description
      t.text :summary
      t.string :originator
      t.string :supplier

      t.timestamps
    end
  end
end
