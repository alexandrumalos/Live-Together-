class RemoveDateFromRequests < ActiveRecord::Migration
  def change
    # the 'created_at' column already handles this so this is a reduntant column
    remove_column :requests, :date
  end
end
