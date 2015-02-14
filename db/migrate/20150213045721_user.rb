class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :status, default: ''
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :facebook

      t.timestamps null: false
    end
  end
end
