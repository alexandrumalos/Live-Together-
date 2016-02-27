class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :name
      t.integer :isNewser

      t.timestamps null: false
    end
  end
end
