class ConnectEventsToProject < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_index :events, :user_id

    add_column :events, :neighborhood_id, :integer
    add_index :events, :neighborhood_id
  end
end
