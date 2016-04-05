class UndoUserMessageMN < ActiveRecord::Migration
  def change
    drop_table :user_message_connections
  end
end
