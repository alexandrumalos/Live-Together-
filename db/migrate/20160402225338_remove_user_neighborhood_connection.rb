class RemoveUserNeighborhoodConnection < ActiveRecord::Migration
  def change
    drop_table :user_neighborhood_connections
  end
end
