class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :user_id, index: true
      t.integer :group_id, index: true

      t.timestamps null: false
    end
  end
end
