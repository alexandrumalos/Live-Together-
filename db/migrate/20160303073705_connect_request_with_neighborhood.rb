class ConnectRequestWithNeighborhood < ActiveRecord::Migration
  def change
    add_column :requests, :neighborhood_id, :integer
    add_index :requests, :neighborhood_id
  end
end
