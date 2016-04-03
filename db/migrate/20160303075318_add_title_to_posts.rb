class AddTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    rename_column :posts, :post, :body
  end
end
