class CreateUserNeighborhoodConnections < ActiveRecord::Migration
  def change
    create_table :user_neighborhood_connections do |t|
      t.belongs_to :user, index: true
      t.belongs_to :neighborhood, index: true

      t.timestamps null: false
    end
  end
end
