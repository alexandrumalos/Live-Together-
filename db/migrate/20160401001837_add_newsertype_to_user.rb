class AddNewsertypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :newser_type, :string
    remove_column :users, :isNewser
  end
end
