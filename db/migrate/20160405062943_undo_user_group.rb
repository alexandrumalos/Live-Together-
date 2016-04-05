class UndoUserGroup < ActiveRecord::Migration
  def change
    drop_table :user_group_connections
  end
end
