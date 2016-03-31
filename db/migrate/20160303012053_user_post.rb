class UserPost < ActiveRecord::Migration
  def chan
    add_column :messages, :text, :string    
    add_index  :user, :id
  end
end
