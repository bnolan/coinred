class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :title, :body, :url, :tags, :embed
    	t.integer :user_id

      t.timestamps
    end
  end
end
