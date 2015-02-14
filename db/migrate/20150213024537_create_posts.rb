class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      .integer "count", default: 0

      t.timestamps null: false
    end
  end
end
