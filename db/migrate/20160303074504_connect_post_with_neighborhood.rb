class ConnectPostWithNeighborhood < ActiveRecord::Migration
  def change
    add_column :posts, :neighborhood_id, :integer
    add_index :posts, :neighborhood_id
  end
end
