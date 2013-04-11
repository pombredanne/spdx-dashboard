class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.text :content
      t.text :notice
      t.string :name
      t.boolean :osi_approved
      t.text :standard_header
      t.string :cross_reference

      t.timestamps
    end
  end
end
