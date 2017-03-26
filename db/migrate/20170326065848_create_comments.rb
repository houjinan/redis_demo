class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :parent_id
      t.integer :root_id

      t.timestamps
    end
  end
end
