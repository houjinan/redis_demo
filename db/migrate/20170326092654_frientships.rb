class Frientships < ActiveRecord::Migration[5.0]
  def change
    create_table :frientships do |t|
      t.integer :current_user_id
      t.integer :frient_user_id
    end
  end
end
