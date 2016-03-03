class CreateUserNeighborhoodConnection < ActiveRecord::Migration
  def change
    create_table :user_neighborhood_connections, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :neighborhood, index: true
    end
  end
end
