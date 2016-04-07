class AddThresholdToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :threshold, :integer
  end
end
