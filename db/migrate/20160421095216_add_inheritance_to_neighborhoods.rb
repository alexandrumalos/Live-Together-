class AddInheritanceToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :parent_id, :integer
    add_index :neighborhoods, :parent_id
  end
end
