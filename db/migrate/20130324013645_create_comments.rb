class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.string :owner_type
      t.text :content
      t.integer :creator_id

      t.timestamps
    end
  end
end
