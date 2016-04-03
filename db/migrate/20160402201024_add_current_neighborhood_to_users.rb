class AddCurrentNeighborhoodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_neighborhood_id, :integer
  end
end
