class CreateUserGroupConnection < ActiveRecord::Migration
  def change
    create_table :user_group_connections, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
    end
  end
end
