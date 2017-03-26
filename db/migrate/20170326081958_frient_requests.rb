class FrientRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :frient_requests do |t|
      t.integer :initiative_user_id
      t.integer :receiver_user_id
      t.boolean :is_agree
      t.timestamps
    end
  end
end
