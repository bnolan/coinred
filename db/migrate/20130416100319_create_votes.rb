class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :user_id, :post_id, :direction

      t.timestamps
    end
  end
end
