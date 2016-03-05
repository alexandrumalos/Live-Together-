class ConnectCategoryToNeighborhood < ActiveRecord::Migration
  def change
    add_column :categories, :neighborhood_id, :integer
    add_index :categories, :neighborhood_id
  end
end
