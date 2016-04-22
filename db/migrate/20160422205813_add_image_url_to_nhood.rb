class AddImageUrlToNhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :image_url, :string
  end
end
